#include "inode_manager.h"
#include <time.h>

// disk layer -----------------------------------------

disk::disk()
{
  // void bzero(void *s,int n) 作用:bzero函数的作用是将s指针指向的地址的前n个字节清零。
  bzero(blocks, sizeof(blocks));
}

// part 1
void disk::read_block(blockid_t id, char *buf)
{
  if (id < 0 || id > BLOCK_NUM || buf == NULL)
    return;
  memcpy(buf, blocks[id], BLOCK_SIZE);
}

// part 1
void disk::write_block(blockid_t id, const char *buf)
{
  if (id < 0 || id > BLOCK_NUM || buf == NULL)
    return;
  memcpy(blocks[id], buf, BLOCK_SIZE);
}

// block layer -----------------------------------------

// Allocate a free disk block.
blockid_t
block_manager::alloc_block()
{
  /*
   * your code goes here.
   * note: you should mark the corresponding bit in block bitmap when alloc.
   * you need to think about which block you can start to be allocated.
   */

  // According to the layout of block area: |<-sb->|<-free block bitmap->|<-inode table->|<-data->|
  // The start block taken into account should be next to the inode table
  // the FILEBLOCK is the start block, it is not about real malloc, but mark the bitmap
  for(int i = FILEBLOCK; i < BLOCK_NUM; i++){
    if(!using_blocks[i]){
      using_blocks[i]=1;
      return i;
    }
  }
  debug_log("block_manager::alloc_block error: Blocks are run out of.\n");
  return 0;
}

void block_manager::free_block(uint32_t id)
{
  /* 
   * your code goes here.
   * note: you should unmark the corresponding bit in the block bitmap when free.
   */
  // ? what is id?
  using_blocks[id]=0;
  return;
}

// The layout of disk should be like this:
// |<-sb->|<-free block bitmap->|<-inode table->|<-data->|
block_manager::block_manager()
{
  d = new disk();

  // format the disk
  sb.size = BLOCK_SIZE * BLOCK_NUM;
  sb.nblocks = BLOCK_NUM;
  sb.ninodes = INODE_NUM;

  // set the using_blocks;
   for(uint i = 0; i < IBLOCK(INODE_NUM, sb.nblocks); i++)
    using_blocks[i] = 1;

}

void block_manager::read_block(uint32_t id, char *buf)
{
  d->read_block(id, buf);
}

void block_manager::write_block(uint32_t id, const char *buf)
{
  d->write_block(id, buf);
}

// inode layer -----------------------------------------

inode_manager::inode_manager()
{
  bm = new block_manager();
  uint32_t root_dir = alloc_inode(extent_protocol::T_DIR);
  if (root_dir != 1)
  {
    printf("\tim: error! alloc first inode %d, should be 1\n", root_dir);
    exit(0);
  }
}

/* Create a new file.
 * Return its inum. */
// part 1
uint32_t
inode_manager::alloc_inode(uint32_t type)
{
  /* 
   * your code goes here.
   * note: the normal inode block should begin from the 2nd inode block.
   * the 1st is used for root_dir, see inode_manager::inode_manager().
   */
  inode *newInode = new inode(type, 0);
  for (int i = 1; i < INODE_NUM; i++)
  {
    inode *ino = get_inode(i);
    if (ino == nullptr)
    {
      put_inode(i, newInode);
      free(newInode);
      return i;
    }
    free(ino);
  }
  return 1;
}

void inode_manager::free_inode(uint32_t inum)
{
  /* 
   * your code goes here.
   * note: you need to check if the inode is already a freed one;
   * if not, clear it, and remember to write back to disk.
   */
  // inode* ino=get_inode(inum);
  // if(!ino){
  //   printf("the inode %d is already freed\n",inum);
  //   return;
  // }

  return;
}

uint32_t inode_manager::get_nodeId_nth(uint32_t n, struct inode *ino){
  // get the nth block id
  if(ino==NULL)
    printf("inode_manager::get_nodeId_nth error, the inode is null");
  if(n < NDIRECT){
    // is in direct blocks
    return ino->blocks[n];
  }
  // read the indirect block
  char buf[BLOCK_SIZE];
  bm->read_block(ino->blocks[NDIRECT],buf);
  return ((blockid_t *)buf)[n-NDIRECT];
}

void inode_manager::alloc_inode_nth(uint32_t n, struct inode *ino){
  // allocate the nth block, in the meantime change the indirect block(if need)
  if(n<NDIRECT)ino->blocks[n] = bm->alloc_block();
  else if( n<= MAXFILE){
    char buf[BLOCK_SIZE];
    bm->read_block(ino->blocks[NDIRECT],buf);
    ((blockid_t *)buf)[n-NDIRECT] = bm->alloc_block();
    bm->write_block(ino->blocks[NDIRECT],buf);
  }else{
    printf("get_nodeId_nth error:  n over NDIRECT !");
    exit(0);
  }
}




/* Return an inode structure by inum, NULL otherwise.
 * Caller should release the memory. */
struct inode *
inode_manager::get_inode(uint32_t inum)
{
  struct inode *ino, *ino_disk;
  char buf[BLOCK_SIZE];

  printf("\tim: get_inode %d\n", inum);

  if (inum < 0 || inum >= INODE_NUM)
  {
    printf("\tim: inum out of range\n");
    return NULL;
  }

  bm->read_block(IBLOCK(inum, bm->sb.nblocks), buf);
  // printf("%s:%d\n", __FILE__, __LINE__);

  ino_disk = (struct inode *)buf + inum % IPB;
  if (ino_disk->type == 0)
  {
    printf("\tim: inode not exist\n");
    return NULL;
  }

  ino = (struct inode *)malloc(sizeof(struct inode));
  *ino = *ino_disk;

  return ino;
}

void inode_manager::put_inode(uint32_t inum, struct inode *ino)
{
  char buf[BLOCK_SIZE];
  struct inode *ino_disk;

  printf("\tim: put_inode %d\n", inum);
  if (ino == NULL)
    return;
  //sb: superblock
  bm->read_block(IBLOCK(inum, bm->sb.nblocks), buf);
  ino_disk = (struct inode *)buf + inum % IPB;
  *ino_disk = *ino;
  bm->write_block(IBLOCK(inum, bm->sb.nblocks), buf);
}

#define MIN(a, b) ((a) < (b) ? (a) : (b))

/* Get all the data of a file by inum. 
 * Return alloced data, should be freed by caller. */
// void inode_manager::read_file(uint32_t inum, char **buf_out, int *size)
// {

//   /*
//    * your code goes here.
//    * note: read blocks related to inode number inum,
//    * and copy them to buf_out
//    */

//   // ? whter the size of inode must 整数倍 BLOCK_SIZE？
//   struct inode *ino = get_inode(inum);
//   int ino_size = ino->size;
//   if (ino == nullptr)
//     return;
//   *size = ino_size;

//   char *tmp = (char *)malloc(sizeof(char) * ino_size);
//   int blockNum = (ino_size % BLOCK_SIZE == 0) ? ino_size / BLOCK_SIZE : ino_size / BLOCK_SIZE + 1;

//   // only use the direct blocks
//   if (blockNum <= NDIRECT)
//   {
//     for (int i = 0; i < blockNum - 1; i++)
//     {
//       bm->read_block((uint32_t)ino->blocks[i], tmp + i * BLOCK_SIZE);
//     }
//   }
//   // use the indirect blocks
//   else
//   {
//     // first deal with the direct blocks
//     for (int i = 0; i < NDIRECT; i++)
//     {
//       bm->read_block((uint32_t)ino->blocks[i], tmp + i * BLOCK_SIZE);
//     }
//     // read the indirect block
//     blockid_t *indiBlock = (blockid_t *)malloc(BLOCK_SIZE);
//     // this is tricky, though the indirect block is filled with 
//     // blockid_t type int, however when we copy we cast it to char*
//     bm->read_block((uint32_t)ino->blocks[NDIRECT],(char*)indiBlock);
//     for(int i=0;i<blockNum-NDIRECT;i++){
//       bm->read_block((uint32_t)indiBlock[i], tmp+(i+NDIRECT)*BLOCK_SIZE);
//     }
//     free(indiBlock);
//   }

//   *buf_out = tmp;
//   ino->atime = time(NULL);
//   put_inode(inum, ino);
//   // must free it after calling get_inode
//   free(ino);
//   return;
// }

void
inode_manager::read_file(uint32_t inum, char **buf_out, int *size)//why use pointer~?fxxk
{
  /*
   * your lab1 code goes here.
   * note: read blocks related to inode number inum,
   * and copy them to buf_Out
   */

  struct inode *ino = get_inode(inum);
  uint32_t blockNum = 0;
  if (ino == NULL)return;
  *size = ino->size;
  // printf("The reading size: %d\n", node->size);

  blockNum = ((*size) % BLOCK_SIZE == 0)?(*size) / BLOCK_SIZE:(*size) / BLOCK_SIZE + 1;
  *buf_out = (char *)malloc(blockNum * BLOCK_SIZE);

  // only use the direct blocks
  if (blockNum <= NDIRECT)
  {
    for (uint32_t i = 0; i < blockNum; i++)
    {
      bm->read_block(ino->blocks[i], *buf_out + i * BLOCK_SIZE);
    }
    delete ino;
    return;
  }
  // use the indirect blocks
  else
  {
    for (uint32_t i = 0; i < NDIRECT; i++)
    {
      bm->read_block(ino->blocks[i], *buf_out + i * BLOCK_SIZE);
    }
    // read the indirect block
    blockid_t *indiBlock = (blockid_t *)malloc(BLOCK_SIZE);
    bm->read_block(ino->blocks[NDIRECT], (char *)indiBlock);
    for (uint32_t i = 0; i < blockNum - NDIRECT; i++)
    {
      bm->read_block(indiBlock[i], *buf_out + NDIRECT * BLOCK_SIZE + i * BLOCK_SIZE);
    }
    // printf("end get\n");
    ino->atime = time(NULL);
    put_inode(inum, ino);
    free(indiBlock);
    free(ino);
    return;
  }
}



/* alloc/free blocks if needed */
void inode_manager::write_file(uint32_t inum, const char *buf, int size)
{
  /*
   * your code goes here.
   * note: write buf to blocks of inode inum.
   * you need to consider the situation when the size of buf 
   * is larger or smaller than the size of original inode
   */

  struct inode *ino = get_inode(inum);
  int oriSize = ino->size;
  if (ino == nullptr) {
    printf("The inode %d being writeen is null!",inum);
    return;
  }
  int oriBlock = (oriSize%BLOCK_SIZE==0)?oriSize / BLOCK_SIZE:oriSize / BLOCK_SIZE+1;
  int newBlock =  (size%BLOCK_SIZE==0)? size / BLOCK_SIZE:size / BLOCK_SIZE+1;
  
  //prepare the space, making the original blocks len = new blocks len
  if(oriBlock>=newBlock){
    for(int i=newBlock;i<oriBlock;i++){
      bm->free_block(get_nodeId_nth(i,ino));
    }
  }else{
    for(int i=oriBlock;i<newBlock;i++){
      alloc_inode_nth(i,ino);
    }
  }
  
  // copy and paste data
  for(int i=0;i<newBlock;i++){
    bm->write_block(get_nodeId_nth(i,ino),buf+i*BLOCK_SIZE);
  }
  ino->mtime = time(NULL);
  ino->ctime = time(NULL);
  put_inode(inum, ino);
  free(ino);
  return;
}

// part 1
void inode_manager::getattr(uint32_t inum, extent_protocol::attr &a)
{
  /*
   * your code goes here.
   * note: get the attributes of inode inum.
   * you can refer to "struct attr" in extent_protocol.h
   */
  inode *ino = get_inode(inum);
  if (ino == nullptr)
    return;
  a.size = ino->size;
  a.type = ino->type;
  a.atime = ino->atime;
  a.ctime = ino->ctime;
  a.mtime = ino->mtime;
  free(ino);
  return;
}

void inode_manager::remove_file(uint32_t inum)
{
  /*
   * your code goes here
   * note: you need to consider about both the data block and inode of the file
   */

  return;
}
