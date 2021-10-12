# Lab1:Basic File System

## lab 说明

需要自己实现一个文件系统

[Lab 1](https://ipads.se.sjtu.edu.cn/courses/cse/labs/lab1.html)

## 文件系统的结构

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled.png)

```cpp
// The layout of disk should be like this:
// |<-sb->|<-free block bitmap->|<-inode table->|<-data->|
```

# part1

```java
sudo docker run -it --rm --privileged --cap-add=ALL -v `pwd`/cse-lab:/home/stu/cse-lab shenjiahuan/cselab_env:1.0 /bin/bash
```

## Part 1A

任务

- disk::read_block
- disk::write_block
- inode_manager::alloc_inode : 找有无空闲inode放入即可
- inode_manager::getattr  ：找到对应的inode，得到attr

test: test_create_and_getattr() in part1_tester

```java
// The layout of disk should be like this:
// |<-sb->|<-free block bitmap->|<-inode table->|<-data->|
```

inode id 就是inode table 里面的第几个

### read_block & write_block

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%201.png)

将buf里面的内容写到对应id的block 里面,并且需要判定一下这个block有没有被allocate过，using block会记录是否存在。

![IMG_8257F94BDC1E-1.jpeg](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/IMG_8257F94BDC1E-1.jpeg)

```cpp
block_manager::block_manager()
{
  d = new disk();
  
  for(uint i = 0; i < IBLOCK(INODE_NUM, sb.nblocks); i++)
    using_blocks[i] = 1;
  // format the disk
  sb.size = BLOCK_SIZE * BLOCK_NUM;
  sb.nblocks = BLOCK_NUM;
  sb.ninodes = INODE_NUM;

}

void
block_manager::read_block(uint32_t id, char *buf)
{
  assert(using_blocks[id]);
  d->read_block(id, buf);
}

void
block_manager::write_block(uint32_t id, const char *buf)
{
  assert(using_blocks[id]);
  d->write_block(id, buf);
}
```

### alloc_inode

第一个inodeid=1 的inode是存了根目录所以从第二个开始，如果是空的就赋值进去。

```java
uint32_t
inode_manager::alloc_inode(uint32_t type)
{
  /* 
   * your code goes here.
   * note: the normal inode block should begin from the 2nd inode block.
   * the 1st is used for root_dir, see inode_manager::inode_manager().
   */
  static int inum = 0;

  printf("\tim: alloc_inode %d\n", type);
  for(int i = 0; i < INODE_NUM; i++){
    inum = (inum + 1) % INODE_NUM;
    inode_t *ino = get_inode(inum);
    if(!ino){
      ino = (inode_t *)malloc(sizeof(inode_t));
      bzero(ino, sizeof(inode_t));
      ino->type = type;
      ino->atime = time(NULL);
      ino->mtime = time(NULL);
      ino->ctime = time(NULL);
      put_inode(inum, ino);
      free(ino);
      break;
    }
    free(ino);
  }

  assert(inum != 0);
  return inum;
}
```

### getattr

直接对应的赋值即可

```cpp
void
inode_manager::getattr(uint32_t inum, extent_protocol::attr &a)
{
  /*
   * your code goes here.
   * note: get the attributes of inode inum.
   * you can refer to "struct attr" in extent_protocol.h
   */
  printf("\tim: getattr %d\n", inum);
  inode_t *ino = get_inode(inum);
  if(!ino)
    return;
  a.type = ino->type;
  a.atime = ino->atime;
  a.mtime = ino->mtime;
  a.ctime = ino->ctime;
  a.size = ino->size;
  free(ino);
  return;
}
```

测试命令

./part1_tester

## Part1 B

You should pay attention to the indirect block test. In our inode manager, each file has only one additional level of indirect block, which means one file has `100 direct block and 1 indirect block` which point to a block filled with other blocks id.

### Inode

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%202.png)

typedef uint32_t blockid_t; 

因为有100个direct block,就是说前面的100个（NDIRECT）block[i]存储的是data block的blockid, 最后一个blocks[NDIRECT]存储的是indirect block的id 而indirect block里面存储的都是 data block的id.就是下面这张图的第二种情况，当然还会有二层，三层

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%203.png)

![截屏2021-09-23 上午11.02.43.png](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/%E6%88%AA%E5%B1%8F2021-09-23_%E4%B8%8A%E5%8D%8811.02.43.png)

多层的inode系统

需要完成的函数

- inode_manager::write_file
- inode_manager::read_file
- block_manager::alloc_block
- block_manager::free_block

### write_file

写文件需要考虑新的文件产生的data block和旧文件的data block 大了还是小了，如果大了就free 原来的空间，如果小了就alloc新block. 这里用了两个自己写的工具函数函数 `alloc_block_nth`和 `get_blockid_nth` ,分别用于分配指定inode对应文件的第n个block,和得到第n个block的block id.

```cpp
/* alloc/free blocks if needed */
void
inode_manager::write_file(uint32_t inum, const char *buf, int size)
{
  /*
   * your code goes here.
   * note: write buf to blocks of inode inum.
   * you need to consider the situation when the size of buf 
   * is larger or smaller than the size of original inode
   */
  int block_num = 0;
  int remain_size = 0;
  int old_blocks, new_blocks;
  char temp[BLOCK_SIZE];
  int i = 0;

  assert(size >= 0 && (uint32_t)size <= MAXFILE * BLOCK_SIZE);
  printf("\tim: write_file %d of size %d\n", inum, size);
  inode_t *ino = get_inode(inum);
  if(ino){
    assert((unsigned int)size <= MAXFILE * BLOCK_SIZE);
    assert(ino->size <= MAXFILE * BLOCK_SIZE);

    old_blocks = ino->size == 0? 0 : (ino->size - 1)/BLOCK_SIZE + 1;
    new_blocks = size == 0? 0 : (size - 1)/BLOCK_SIZE + 1;
    if(old_blocks < new_blocks)
      for(int j = old_blocks; j < new_blocks; j++)
        alloc_block_nth(ino, j);
    else if(old_blocks > new_blocks)
      for(int j = new_blocks; j < old_blocks; j++)
        bm->free_block(get_blockid_nth(ino, j));

    block_num = size / BLOCK_SIZE;
    remain_size = size % BLOCK_SIZE;

    for(; i < block_num; i++)
      bm->write_block(get_blockid_nth(ino, i), buf + i*BLOCK_SIZE);
    if(remain_size){
      memcpy(temp, buf + i*BLOCK_SIZE, remain_size);
      bm->write_block(get_blockid_nth(ino, i), temp);
    }

    ino->size = size;
    ino->atime = time(NULL);
    ino->mtime = time(NULL);
    ino->ctime = time(NULL);
    put_inode(inum, ino);
    free(ino);
  }
  return;
}
```

```cpp
void 
inode_manager::alloc_block_nth(inode_t *ino, uint32_t n)
{
  char buf[BLOCK_SIZE];
  assert(ino);
  printf("\tim: alloc_block_nth %d\n", n);

  if(n < NDIRECT)
    ino->blocks[n] = bm->alloc_block();
  else if(n < MAXFILE){
    if(!ino->blocks[NDIRECT]){
      printf("\tim: alloc_block_nth new NINDIRECT!\n");
      ino->blocks[NDIRECT] = bm->alloc_block();
    }
    bm->read_block(ino->blocks[NDIRECT], buf);      
    ((blockid_t *)buf)[n-NDIRECT] = bm->alloc_block();
    bm->write_block(ino->blocks[NDIRECT], buf); 
  }else{
    printf("\tim: alloc_block_nth out of range\n");
    exit(0);
  }
}

blockid_t
inode_manager::get_blockid_nth(inode_t *ino, uint32_t n)
{
  char buf[BLOCK_SIZE];
  blockid_t res;

  assert(ino);
  printf("\tim: get_blockid_nth %d\n", n);
  if(n < NDIRECT)
    res = ino->blocks[n];
  else if(n < MAXFILE){
    if(!ino->blocks[NDIRECT])
      printf("\tim: get_blockid_nth none NINDIRECT!\n");
    bm->read_block(ino->blocks[NDIRECT], buf);      
    
    res = ((blockid_t *)buf)[n-NDIRECT];
  }else{
    printf("\tim: get_blockid_nth out of range\n");
    exit(0);
  }

  return res;
}
```

### alloc_block & free_block

因为block的数据 是磁盘blocks[BLOCK_NUM][BLOCK_SIZE]里面的，所以是已经分配好的，这里并不会有alloc,free 函数，而是对占用的block做一个标志就可以了。

```cpp
blockid_t
block_manager::alloc_block()
{
  /*
   * your code goes here.
   * note: you should mark the corresponding bit in block bitmap when alloc.
   * you need to think about which block you can start to be allocated.
   */
  for(int i = FILEBLOCK; i < BLOCK_NUM; i++)
    if(!using_blocks[i]){
      using_blocks[i] = 1;
      return i;
    }
  printf("\tim: error! alloc_block failed!\n");
  return 0;
}

void
block_manager::free_block(uint32_t id)
{
  /* 
   * your code goes here.
   * note: you should unmark the corresponding bit in the block bitmap when free.
   */
  using_blocks[id] = 0;
  return;
}
```

![IMG_FAD25372BC7C-1.jpeg](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/IMG_FAD25372BC7C-1.jpeg)

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%204.png)

注意这里的处理，很巧妙但是我觉得这么写更容易理解

```cpp
old_blocks = ((ino->size) % BLOCK_SIZE == 0) ? 
			(*size) / BLOCK_SIZE : (*size) / BLOCK_SIZE + 1;
```

如果能不能除尽BLOCK_SIZE，就多算一个。

## 三个time

当修改mtime时,ctime必须随着改变.因为文件大小等都属性；

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%205.png)

# Part 2

补充fuse.cc和chfs.client,这两个函数会调用part1写的inode_manager 中的函数

## 关键函数理解 put get

用到很多的是ec→put(ino, buf) 和ec→ get(ino,buf)

看下来就是把inode number =ino的inode对应的文件读到buf里面或者把buf里面的内容写进去。最底层的是调用了write_file

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%206.png)

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%207.png)

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%208.png)

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%209.png)

ec→get 

## part2A

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%2010.png)

Todo: CREATE/MKNOD, LOOKUP and READDIR of chfs_client.cc in ChFS.

some functions in fuse.cc

logic

Your [fuse.cc](http://fuse.cc/) code should pass inums, file names, etc. to your chfs_client methods. Your chfs_client code should retrieve file and directory contents from the extent client with get(), using the inum as the extent ID. 

### filename

the EXT3 filesystem which we go after supports any characters but '\0' and '/' in the filename. Make sure your code passes when there's '$', '_', ' ', etc, in the filename.

### create & mkdir

这里可以知道其实文件和目录，在inode层面下，他都是文件，但是呢有一个type会赋值给对应的inode,所以写了一个createFileOrDir做代码复用了

```cpp
int chfs_client::createFileOrDir(inum parent, const char *name, mode_t mode, inum &ino_out, int type)
{
  int r = OK;
  bool found = false;
  inum tmp;                         // not necessary so why?
  lookup(parent, name, found, tmp); // ?need to find out after implement findout
  if (found)
    return EXIST;
  // pick an inum
  ec->create(type, ino_out);
  // get the exist content in the parent directory
  // then append one to it. it same for directory of file.
  std::string buf;
  ec->get(parent, buf);
  buf.append(std::string(name) + ":" + filename(ino_out) + "/");
  ec->put(parent, buf);
  return r;
}

int chfs_client::create(inum parent, const char *name, mode_t mode, inum &ino_out)
{
  int r = OK;
  printf("create parent: %llu, name: %s\n", parent, name);

  /*
     * your code goes here.
     * note: lookup is what you need to check if file exist;
     * after create file or dir, you must remember to modify the parent infomation.
     */
  r = createFileOrDir(parent, name, mode, ino_out, extent_protocol::T_FILE);

  return r;
}

int chfs_client::mkdir(inum parent, const char *name, mode_t mode, inum &ino_out)
{
  int r = OK;
  printf("mkdir parent: %llu, name: %s\n", parent, name);

  /*
     * your code goes here.
     * note: lookup is what you need to check if directory exist;
     * after create file or dir, you must remember to modify the parent infomation.
     */
  r = createFileOrDir(parent, name, mode, ino_out, extent_protocol::T_DIR);

  return r;
}
```

### readdir &  lookup

readdir 就真正能体现这个data block的读取了。用get方法拿到directory文件的data,这里看到在inodemanage全部都封装到get()函数里面了。接下来的读取和当时目录的规定存储方式相关，这里是 "name:inum/name:inum/name:inum/" 所以用find和substr去切割就得到每个entry了。

```cpp
int chfs_client::readdir(inum dir, std::list<dirent> &list)
{
  int r = OK;

  /*
     * your code goes here.
     * note: you should parse the dirctory content using your defined format,
     * and push the dirents to the list.
     */
  // my format of dir content: "name:inum/name:inum/name:inum/"

  // get directory content
  std::string buf;
  ec->get(dir, buf);

  // traverse directory content
  long unsigned int nameStart = 0;
  long unsigned int nameEnd = buf.find(':');
  while (nameEnd != std::string::npos)
  {
    std::string name = buf.substr(nameStart, nameEnd - nameStart);
    int inumStart = nameEnd + 1;
    int inumEnd = buf.find('/', inumStart);
    std::string inum = buf.substr(inumStart, inumEnd - inumStart);

    struct dirent entry;
    entry.name = name;
    entry.inum = n2i(inum);

    list.push_back(entry);

    nameStart = inumEnd + 1;
    nameEnd = buf.find(':', nameStart);
  }

  return r;
}

int chfs_client::lookup(inum parent, const char *name, bool &found, inum &ino_out)
{
  int r = OK;

  /*
     * your code goes here.
     * note: lookup file from parent dir according to name;
     * you should design the format of directory content.
     */

  std::list<dirent> list;
  printf("lookup parent: %llu, name: %s\n", parent, name);
  readdir(parent, list);
  found = false;
  if (list.empty())
  {
    return r;
  }

  for (std::list<dirent>::iterator it = list.begin(); it != list.end(); it++)
  {
    if (it->name.compare(name) == 0)
    {
      ino_out = it->inum;
      found = true;
      return r;
    }
  }
  return r;
}
```

## test

```java
$ make
$ sudo ./start.sh
starting ./chfs_client /home/stu/cse-lab/chfs1  > chfs_client1.log 2>&1 &
$ sudo ./test-lab1-part2-a.pl ./chfs1
create file-yyuvjztagkprvmxjnzrbczmvmfhtyxhwloulhggy-18674-0
create file-hcmaxnljdgbpirprwtuxobeforippbndpjtcxywf-18674-1
...
Passed all tests!
```

### part 2B

SETATTR, WRITE, and READ FUSE in [fuse.cc](http://fuse.cc) and chfs_client.cc

### setattr

作业只要求对于size进行更改，拿到原有的文件的buf, 然后resize 放回就可以了

```java
// Only support set size of attr
int chfs_client::setattr(inum ino, size_t size)
{
  int r = OK;

  /*
     * your code goes here.
     * note: get the content of inode ino, and modify its content
     * according to the size (<, =, or >) content length.
     */

  std::string buf;
  ec->get(ino, buf);
  buf.resize(size);
  ec->put(ino,buf);
  return r;
}
```

`resize` 会把多的空用\0填充

![截屏2021-10-09 下午6.12.46.png](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/%E6%88%AA%E5%B1%8F2021-10-09_%E4%B8%8B%E5%8D%886.12.46.png)

[string.reserve 与 string.resize的区别_数据之美的博客-CSDN博客](https://blog.csdn.net/oppo62258801/article/details/75949802)

### read & write

read 开始读的位置可能超过了size,这样就data设置空

write开始如果是覆盖写文本长度不变的话，那就覆盖了，如果(offset + 写的文本的size) 超过了现有文件的size,那需要扩容

```cpp
int chfs_client::read(inum ino, size_t size, off_t off, std::string &data)
{
  int r = OK;

  /*
     * your code goes here.
     * note: read using ec->get().
     */
  printf("read ino: %llu, size: %lu, off: %lu", ino, size, off);
  std::string buf;
  ec->get(ino, buf);
  printf("read buf: %s", buf.c_str());
  if ((unsigned int)off >= buf.size())
  {
    data.erase();
    return r;
  }

  data = buf.substr(off, size);
  return r;
}

int chfs_client::write(inum ino, size_t size, off_t off, const char *data,
                       size_t &bytes_written)
{
  int r = OK;

  /*
     * your code goes here.
     * note: write using ec->put().
     * when off > length of original file, fill the holes with '\0'.
     */
  printf("write ino: %llu, size: %lu, off: %lu", ino, size, off);
  std::string buf;
  ec->get(ino, buf);
  printf("write buf: %s", buf.c_str());
  // off + write size <= file size
  if (off + size <= buf.size())
  {
    for (long unsigned int i = off; i < off + size; i++)
    {
      buf[i] = data[i - off];
    }
    bytes_written = size;
    ec->put(ino, buf);
    return r;
  }

  // off + write size > file size
  buf.resize(off + size);
  for (long unsigned int i = off; i < off + size; i++)
  {
    buf[i] = data[i - off];
  }
  bytes_written = size;
  ec->put(ino, buf);
  return r;
}
```

[fuse.cc](http://fuse.cc) 中的代码基本如下大同小异都改一下，if 0→ if 1，不赘述了具体可看代码

```cpp
void
fuseserver_write(fuse_req_t req, fuse_ino_t ino,
        const char *buf, size_t size, off_t off,
        struct fuse_file_info *fi)
{
#if 1
  int r;
    if ((r = chfs->write(ino, size, off, buf, size)) == chfs_client::OK) {
        fuse_reply_write(req, size);
    } else {
        fuse_reply_err(req, ENOENT);
    }

    // Change the above line to "#if 1", and your code goes here
#else
    fuse_reply_err(req, ENOSYS);
#endif
```

### part2C

task: MKDIR and UNLINK FUSE operations.

mkdir 和文件是一样的

```cpp
int chfs_client::mkdir(inum parent, const char *name, mode_t mode, inum &ino_out)
{
  int r = OK;
  printf("mkdir parent: %llu, name: %s\n", parent, name);

  /*
     * your code goes here.
     * note: lookup is what you need to check if directory exist;
     * after create file or dir, you must remember to modify the parent infomation.
     */
  r = createFileOrDir(parent, name, mode, ino_out, extent_protocol::T_DIR);

  return r;
}
```

### unlink

意思是删除文件，需要把inode删除，对应的目录里的条目删除

```cpp
int chfs_client::unlink(inum parent, const char *name)
{
  int r = OK;

  /*
     * your code goes here.
     * note: you should remove the file using ec->remove,
     * and update the parent directory content.
     */
  printf("unlink parent: %llu, name: %s\n", parent, name);
  bool found = false;
  inum ino_out;
  lookup(parent, name, found, ino_out);
  if (!found)
    return r;

  // remove the file
  ec->remove(ino_out);
  // update parent directory
  std::string buf;
  ec->get(parent, buf);

  // find the key-value "name:inum/name:inum/name:inum/"
  int name_start = buf.find(name);
  int inum_after = buf.find('/', name_start);
  buf.erase(name_start, inum_after - name_start + 1);
  ec->put(parent, buf);
  return r;
}
```

### part2d

增加symbolic link

提供的链接：

[How to make symbolic links in FUSE?](https://stackoverflow.com/questions/6096193/how-to-make-symbolic-links-in-fuse)

## symbolic link

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%2011.png)

**What are symbolic links?**

Symbolic links are essentially shortcuts that reference to a file instead of its inode value. This method can be applied to directories and can reference across different hard disks/volumes. Since the symbolic link is referring to the original file and not its inode value, then replacing the original file into a different folder will break the symbolic link, or create a dangling link.

直接指向文件，而不是inode, 所以文件挪到其他位置，会导致link 悬空，失效。可以通过symbolic link 修改文件内容

So symbolic links can be seen as a static link to the last known location of the original file. The link should work even if you replace the original file with a different file with the same name.

可以看成是对于文件的静态链接，甚至如果把文件换成一个同位置同名字的文件，依然是可以成立的。

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%2012.png)

[https://en.wikipedia.org/wiki/Symbolic_link#Variable_symbolic_links](https://en.wikipedia.org/wiki/Symbolic_link#Variable_symbolic_links)

讲解的比较好的symbolic links

[Hard links and Symbolic links - A comparison](https://medium.com/@307/hard-links-and-symbolic-links-a-comparison-7f2b56864cdd)

实现参考了Jonior 的代码

### issymlink & symlink & readlink

issymlink 用来判定type是不是T_SYMLINK

symlink 创建symbolic link, 这里有趣的一点是，symbolic link是有`新建inode`的,用ino_out来表示，其实这里和创建文件是类似的，symbolic_link 的name就是创建的新的soft link的名字，打印如下

`symlink(inum parent, const char *name, const char *link, inum &ino_out)`

log里面的参数格式

![Untitled](Lab1%20Basic%20File%20System%201f79b64d8a3041258b947a6dc1dd7f8e/Untitled%2013.png)

如果同样的softlink 已经找到了，那不用了，没找到就像新建inode, 其中的data存的是link (/etc/hostslookup)。注意更新一下directory，在readlink的时候其实就是要读到里面放的link, 所以读inode里面放的data(/etc/hostslookup)

```cpp
bool chfs_client::issymlink(inum inum)
{
  printf("issymlink inum: %lld\n", inum);
  extent_protocol::attr a;

  if (ec->getattr(inum, a) != extent_protocol::OK)
  {
    printf("error getting attr\n");
    return false;
  }

  if (a.type == extent_protocol::T_SYMLINK)
  {
    printf("isfile: %lld is a symlink\n", inum);
    return true;
  }
  printf("isfile: %lld is not a symlink\n", inum);
  return false;
}

int chfs_client::symlink(inum parent, const char *name, const char *link, inum &ino_out)
{
  int r = OK;
  printf("symlink parent: %llu, name: %s, link: %s", parent, name, link);

  // check if symlink name has existed
  bool found = false;
  inum tmp; // not necessary
  lookup(parent, name, found, tmp);
  if (found)
  {
    // has existed
    return EXIST;
  }

  // pick an inum and put the link to the new inode
  // the biggest difference between symbolic link and hardlink is that
  // symlink store the link to the path, while the hardlink stores
  // the link to the data block.
  ec->create(extent_protocol::T_SYMLINK, ino_out);
  ec->put(ino_out, std::string(link));

  // add an entry into parent
  std::string buf;
  ec->get(parent, buf);
  buf.append(std::string(name) + ":" + filename(ino_out) + "/");
  ec->put(parent, buf);

  printf("finish symlink, put name:%s",name);
  return r;
}

int chfs_client::readlink(inum ino, std::string &data)
{
  printf("readlink inum: %llu\n", ino);
  int r = OK;
  std::string buf;
  ec->get(ino, buf);
  data = buf;
  return r;
}
```

### symbolic link 下的isdir

没有symlink前只有两种情况，现在多了一种type，所以直接对T_DIR进行判断

```cpp
return !isfile(inum);

bool chfs_client::isfile(inum inum)
{
  extent_protocol::attr a;

  if (ec->getattr(inum, a) != extent_protocol::OK)
  {
    printf("error getting attr\n");
    return false;
  }

  if (a.type == extent_protocol::T_FILE)
  {
    printf("isfile: %lld is a file\n", inum);
    return true;
  }
  printf("isfile: %lld is a dir\n", inum);
  return false;
}
```

补充后

```cpp
bool chfs_client::isdir(inum inum)
{
  // Oops! is this still correct when you implement symlink?
  // return !isfile(inum);
  extent_protocol::attr a;

  if (ec->getattr(inum, a) != extent_protocol::OK)
  {
    printf("error getting attr\n");
    return false;
  }

  if (a.type == extent_protocol::T_DIR)
  {
    printf("isfile: %lld is a dir\n", inum);
    return true;
  }
  printf("isfile: %lld is not a dir\n", inum);
  return false;
}

int chfs_client::getfile(inum inum, fileinfo &fin)
{
  int r = OK;

  printf("getfile %016llx\n", inum);
  extent_protocol::attr a;
  if (ec->getattr(inum, a) != extent_protocol::OK)
  {
    r = IOERR;
    goto release;
  }

  fin.atime = a.atime;
  fin.mtime = a.mtime;
  fin.ctime = a.ctime;
  fin.size = a.size;
  printf("getfile %016llx -> sz %llu\n", inum, fin.size);

release:
  return r;
}
```

## 辅助函数

`memcpy`

void *memcpy(void *destin, void *source, unsigned n)；

函数的功能是从源内存地址的起始位置开始拷贝若干个字节到目标内存地址中，即从源source中拷贝n个字节到目标destin中。

`memset`

void *memset(void *str, int c, size_t n) 

复制字符 c（一个无符号字符）到参数 str 所指向的字符串的前 n 个字符。该值返回一个指向存储区 str 的指针。

```java
#include <stdio.h>
#include <string.h>
 
int main ()
{
   char str[50];
 
   strcpy(str,"This is string.h library function");
   puts(str);
 
   memset(str,'$',7);
   puts(str);
   
   return(0);
}
```

结果

```
This is string.h library function
$$$$$$$ string.h library function
```

`malloc`

 ***malloc 则必须由我们计算要字节数，并且在返回后强行转换为实际类型的指针。***

int* p;

p = (int *) malloc (sizeof(int));

最后要free(p)

free 和 delete 不能混用，也就是说new 分配的内存空间最好不要使用使用free 来释放，malloc 分配的空间也不要使用 delete来释放

`bzero`

函数所在头文件：#include <string.h>

函数原型： void bzero(void *s, int n);

*函数参数：s为内存（字符串）指针，所指定内存块的首地址，n 为需要清零的字节数。*

# reference

参考了前辈的作业，感觉写这个Lab确实有些困难但是搞清楚了究竟是🙂

[CSE-lab/inode_manager.cc at lab4 · HR-SU/CSE-lab](https://github.com/HR-SU/CSE-lab/blob/lab4/inode_manager.cc)

[CSE-Labs/inode_manager.cc at master · gaocegege/CSE-Labs](https://github.com/gaocegege/CSE-Labs/blob/master/lab1/inode_manager.cc)

[CSE-lab/inode_manager.cc at lab1 · Girafboy/CSE-lab](https://github.com/Girafboy/CSE-lab/blob/lab1/inode_manager.cc)

[[原]UNIX内核（5）：inode与文件、目录-fera-ChinaUnix博客](http://blog.chinaunix.net/uid-7471615-id-83766.html)

[inode pointer structure - Wikipedia](https://en.wikipedia.org/wiki/Inode_pointer_structure)

part2

[Junior/yfs_client.cc at master · Gusabary/Junior](https://github.com/Gusabary/Junior/blob/master/CSE/lab-1/yfs_client.cc)

[CSE-labs/yfs_client.cc at lab1 · TongRuizheWithGzz/CSE-labs](https://github.com/TongRuizheWithGzz/CSE-labs/blob/lab1/yfs_client.cc)