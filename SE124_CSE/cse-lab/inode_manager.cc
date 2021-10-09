#include "inode_manager.h"

#define _DEBUG 1
#define debug_log(...)              \
  do                                \
  {                                 \
    if (_DEBUG)                     \
    {                               \
      printf("Line %d ", __LINE__); \
      printf(__VA_ARGS__);          \
    }                               \
  } while (0)
// disk layer -----------------------------------------

disk::disk()
{
  bzero(blocks, sizeof(blocks));
}

// part 1
void disk::read_block(blockid_t id, char *buf)
{
  if (id < 0 || id > BLOCK_NUM || buf == NULL)
    return;
  memcpy(buf, blocks[id], BLOCK_SIZE);
}

void disk::write_block(blockid_t id, const char *buf)
{
  if (id < 0 || id > BLOCK_NUM || buf == NULL)
    return;
  memcpy(blocks[id], buf, BLOCK_SIZE);
}

void disk::print_status(uint32_t id)
{
  printf("\t\tBLOCK%d ", id);
  for (int i = 0; i < BLOCK_SIZE; i++)
    printf("%x", blocks[id][i]);
  printf("\n");
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
  for (int i = FILEBLOCK; i < BLOCK_NUM; i++)
    if (!using_blocks[i])
    {
      using_blocks[i] = 1;
      return i;
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
  using_blocks[id] = 0;
  return;
}

// The layout of disk should be like this:
// |<-sb->|<-free block bitmap->|<-inode table->|<-data->|
block_manager::block_manager()
{
  d = new disk();

  for (uint i = 0; i < IBLOCK(INODE_NUM, sb.nblocks); i++)
    using_blocks[i] = 1;
  // format the disk
  sb.size = BLOCK_SIZE * BLOCK_NUM;
  sb.nblocks = BLOCK_NUM;
  sb.ninodes = INODE_NUM;
}

void block_manager::read_block(uint32_t id, char *buf)
{
  assert(using_blocks[id]);
  d->read_block(id, buf);
}

void block_manager::write_block(uint32_t id, const char *buf)
{
  assert(using_blocks[id]);
  d->write_block(id, buf);
}

void block_manager::print_status()
{
  for (int i = 0; i < BLOCK_NUM; i++)
    if (using_blocks[i])
      d->print_status(i);
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
  inode *newInode = new inode();
  newInode->type = type;
  newInode->atime = newInode->ctime = newInode->mtime = time(NULL);
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
  printf("\tim: free_inode %d\n", inum);
  inode_t *ino = get_inode(inum);
  if (ino)
  {
    if (!ino->type)
    {
      printf("the inode is already empty!");
      return;
    }
    // inode type=0,means empty
    ino->type = 0;
    ino->atime = ino->ctime = ino->mtime = 0;
    put_inode(inum, ino);
    free(ino);
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
  assert(ino);

  bm->read_block(IBLOCK(inum, bm->sb.nblocks), buf);
  ino_disk = (struct inode *)buf + inum % IPB;
  *ino_disk = *ino;
  bm->write_block(IBLOCK(inum, bm->sb.nblocks), buf);
}

blockid_t
inode_manager::get_blockid_nth(inode_t *ino, uint32_t n)
{
  // get the nth block id
  char buf[BLOCK_SIZE];

  if (ino == NULL)
    printf("inode_manager::get_nodeId_nth error, the inode is null");

  if (n < NDIRECT)
    return ino->blocks[n];

  bm->read_block(ino->blocks[NDIRECT], buf);
  return ((blockid_t *)buf)[n - NDIRECT];
}

void inode_manager::alloc_block_nth(inode_t *ino, uint32_t n)
{
  char buf[BLOCK_SIZE];
  if(ino==NULL){
    printf("inode_manager::get_nodeId_nth error, the inode is null");
    exit(0);
  }
  printf("\tim: alloc_block_nth %d\n", n);

  if (n < NDIRECT)
    ino->blocks[n] = bm->alloc_block();
  else if (n < MAXFILE)
  {
    if (!ino->blocks[NDIRECT])
    {
      printf("\tim: alloc_block_nth new NINDIRECT!\n");
      ino->blocks[NDIRECT] = bm->alloc_block();
    }
    bm->read_block(ino->blocks[NDIRECT], buf);
    ((blockid_t *)buf)[n - NDIRECT] = bm->alloc_block();
    bm->write_block(ino->blocks[NDIRECT], buf);
  }
  else
  {
    printf("get_nodeId_nth error:  n over NDIRECT !");
    exit(0);
  }
}

#define MIN(a, b) ((a) < (b) ? (a) : (b))

/* Get all the data of a file by inum. 
 * Return alloced data, should be freed by caller. */
// V
void inode_manager::read_file(uint32_t inum, char **buf_out, int *size) //why use pointer~?fxxk
{
  /*
   * your lab1 code goes here.
   * note: read blocks related to inode number inum,
   * and copy them to buf_Out
   */

  struct inode *ino = get_inode(inum);
  uint32_t blockNum = 0;
  if (ino == NULL)
    return;
  *size = ino->size;
  blockNum = ((*size) % BLOCK_SIZE == 0) ? (*size) / BLOCK_SIZE : (*size) / BLOCK_SIZE + 1;
  *buf_out = (char *)malloc(blockNum * BLOCK_SIZE);

  // use the direct blocks
  if (blockNum <= NDIRECT)
  {
    for (uint32_t i = 0; i < blockNum; i++)
    {
      bm->read_block(ino->blocks[i], *buf_out + i * BLOCK_SIZE);
    }
    free(ino);
    return;
  }
  // use the indirect blocks
  else
  {
    // first deal with the direct blocks
    for (uint32_t i = 0; i < NDIRECT; i++)
    {
      bm->read_block(ino->blocks[i], *buf_out + i * BLOCK_SIZE);
    }
    // read the indirect block
    blockid_t *indiBlock = (blockid_t *)malloc(BLOCK_SIZE);
    // this is tricky, though the indirect block is filled with
    // blockid_t type int, however when we copy we cast it to char*
    bm->read_block(ino->blocks[NDIRECT], (char *)indiBlock);
    for (uint32_t i = 0; i < blockNum - NDIRECT; i++)
    {
      bm->read_block(indiBlock[i], *buf_out + NDIRECT * BLOCK_SIZE + i * BLOCK_SIZE);
    }

    ino->atime = time(NULL);
    put_inode(inum, ino);
    // must free it after calling get_inode
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

  char temp[BLOCK_SIZE];
  int i = 0;
  inode_t *ino = get_inode(inum);
  if (ino == NULL)
  {
    printf("The inode %d being writeen is null!", inum);
    return;
  }
  int old_blocks = (ino->size%BLOCK_SIZE==0)?ino->size / BLOCK_SIZE: ino->size / BLOCK_SIZE+1;
  int new_blocks =  (size%BLOCK_SIZE==0)? size / BLOCK_SIZE:size / BLOCK_SIZE+1;

  if (old_blocks < new_blocks)
    for (int j = old_blocks; j < new_blocks; j++)
      alloc_block_nth(ino, j);
  else if (old_blocks > new_blocks)
    for (int j = new_blocks; j < old_blocks; j++)
      bm->free_block(get_blockid_nth(ino, j));

  int blockNum = size / BLOCK_SIZE;
  int remain = size % BLOCK_SIZE;

  for (; i < blockNum; i++)
    bm->write_block(get_blockid_nth(ino, i), buf + i * BLOCK_SIZE);
  if (remain)
  {
    memcpy(temp, buf + i * BLOCK_SIZE, remain);
    bm->write_block(get_blockid_nth(ino, i), temp);
  }
  // when write file, you only need to change the m&c time;
  ino->mtime = time(NULL);
  ino->ctime = time(NULL);
  ino->size = size;
  
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
// part 1C
void inode_manager::remove_file(uint32_t inum)
{
  /*
   * your code goes here
   * note: you need to consider about both the data block and inode of the file
   */
  inode_t *ino = get_inode(inum);
  uint32_t blockNum = (ino->size % BLOCK_SIZE) ? ino->size / BLOCK_SIZE + 1 : ino->size / BLOCK_SIZE;

  if (blockNum <= NDIRECT)
  {
    free_inode(inum);
  }
  else
  {
    blockid_t *buf = (blockid_t *)malloc(BLOCK_SIZE);
    bm->read_block(ino->blocks[NDIRECT], (char *)buf);
    for (uint32_t i = 0; i < blockNum - NDIRECT; i++)
    {
      bm->free_block(buf[i]);
    }
  }
  return;
}