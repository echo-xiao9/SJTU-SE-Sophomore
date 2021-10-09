// chfs client.  implements FS operations using extent and lock server
#include "chfs_client.h"
#include "extent_client.h"
#include <sstream>
#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>

chfs_client::chfs_client()
{
  ec = new extent_client();
}

chfs_client::chfs_client(std::string extent_dst, std::string lock_dst)
{
  ec = new extent_client();
  if (ec->put(1, "") != extent_protocol::OK)
    printf("error init root dir\n"); // XYB: init root dir
}

chfs_client::inum
chfs_client::n2i(std::string n)
{
  std::istringstream ist(n);
  unsigned long long finum;
  ist >> finum;
  return finum;
}

std::string
chfs_client::filename(inum inum)
{
  std::ostringstream ost;
  ost << inum;
  return ost.str();
}

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
/** Your code here for Lab...
 * You may need to add routines such as
 * readlink, issymlink here to implement symbolic link.
 * 
 * */

bool chfs_client::isdir(inum inum)
{
  // Oops! is this still correct when you implement symlink?
  return !isfile(inum);
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

int chfs_client::getdir(inum inum, dirinfo &din)
{
  int r = OK;

  printf("getdir %016llx\n", inum);
  extent_protocol::attr a;
  if (ec->getattr(inum, a) != extent_protocol::OK)
  {
    r = IOERR;
    goto release;
  }
  din.atime = a.atime;
  din.mtime = a.mtime;
  din.ctime = a.ctime;

release:
  return r;
}

#define EXT_RPC(xx)                                          \
  do                                                         \
  {                                                          \
    if ((xx) != extent_protocol::OK)                         \
    {                                                        \
      printf("EXT_RPC Error: %s:%d \n", __FILE__, __LINE__); \
      r = IOERR;                                             \
      goto release;                                          \
    }                                                        \
  } while (0)

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

// - If a file named @name already exists in @parent, return EXIST.
// - Pick an ino (with type of chfs_client::inum) for file @name.
//   Make sure ino indicates a file, not a directory!
// - Create an empty extent for ino.
// - Add a <name, ino> entry into @parent.
// - Change the parent's mtime and ctime to the current time/date
//   (this may fall naturally out of your extent server code).
// - On success, store the inum of newly created file into @e->ino,
//   and the new file's attribute into @e->attr. Get the file's
//   attributes with getattr().
//



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

int
chfs_client::lookup(inum parent, const char *name, bool &found, inum &ino_out)
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
    if (list.empty()) {
        return r;
    }

    for (std::list<dirent>::iterator it = list.begin(); it != list.end(); it++) {
        if (it->name.compare(name) == 0) {
            ino_out = it->inum;
            found = true;
            return r;
        }
    }
    return r;
}



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
    long unsigned int  nameStart = 0;
    long unsigned int nameEnd = buf.find(':');
    while (nameEnd != std::string::npos) {
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

int
chfs_client::read(inum ino, size_t size, off_t off, std::string &data) {
    int r = OK;

    /*
     * your code goes here.
     * note: read using ec->get().
     */
    printf("read ino: %llu, size: %lu, off: %lu", ino, size, off);
    std::string buf;
    ec->get(ino, buf);
    printf("read buf: %s", buf.c_str());
    if ((unsigned int) off >= buf.size()) {
        data.erase();
        return r;
    }

    data = buf.substr(off, size);
    return r;
}

int
chfs_client::write(inum ino, size_t size, off_t off, const char *data,
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
    if (off + size <= buf.size()) {
        for (long unsigned int i = off; i < off + size; i++) {
            buf[i] = data[i - off];
        }
        bytes_written = size;
        ec->put(ino, buf);
        return r;
    }

    // off + write size > file size
    buf.resize(off + size);
    for (long unsigned int i = off; i < off + size; i++) {
        buf[i] = data[i - off];
    }
    bytes_written = size;
    ec->put(ino, buf);
    return r;
}

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
  lookup(parent, name,found,ino_out);
  if(!found) return r;

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
