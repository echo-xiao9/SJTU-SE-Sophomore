// 518431910002 Yixao Kang
#include "cachelab.h"
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <limits.h>
#include <getopt.h>
#include <string.h>

// This is the parameter that we're simulating, and we're setting it
// to be global in order to call it from within the function

// -s <s>: Number of set index bits (S = 2^s is the number of sets)
// -E <E>: Associativity (number of lines per set)
// -b <b>: Number of block bits (B = 2^b is the block size)
//  -t <tracefile>: Name of the valgrind trace to replay

int h, v, s, E, b, S;

int hit_count,
    miss_count,
    eviction_count; // printSummary parameter

char t[1000]; //  getopt result，indicate the trace file name.

typedef struct
{
  int valid_bits;
  int tag;
  int stamp;
} CacheLine, *CacheAsso, **Cache; // cache

Cache myCache = NULL;

// print help
void printUsage()
{
  printf("Usage: ./csim-ref [-hv] -s <num> -E <num> -b <num> -t <file>\n"
         "Options:\n"
         "  -h         Print this help message.\n"
         "  -v         Optional verbose flag.\n"
         "  -s <num>   Number of set index bits.\n"
         "  -E <num>   Number of lines per set.\n"
         "  -b <num>   Number of block offset bits.\n"
         "  -t <file>  Trace file.\n\n"
         "Examples:\n"
         "  linux>  ./csim-ref -s 4 -E 1 -b 4 -t traces/yi.trace\n"
         "  linux>  ./csim-ref -v -s 8 -E 2 -b 4 -t traces/yi.trace\n");
}

void init_cache()
{
  myCache = (Cache)malloc(sizeof(CacheAsso) * S);
  for (int i = 0; i < S; ++i)
  {
    myCache[i] = (CacheAsso)malloc(sizeof(CacheLine) * E);
    for (int j = 0; j < E; ++j)
    {
      myCache[i][j].valid_bits = 0;
      myCache[i][j].tag = -1;
      myCache[i][j].stamp = -1;
    }
  }
}

void loadData(unsigned int address)
{
 
  int setindex_add = (address >> b) & ((-1U) >> (64 - s));
  int tag_add = address >> (b + s);

  int max_stamp = INT_MIN;
  int max_stamp_index = -1;

  for (int i = 0; i < E; ++i) // if the tag is the same ,update stamp
  {
    if (myCache[setindex_add][i].tag == tag_add)
    {
      myCache[setindex_add][i].stamp = 0;
      ++hit_count;
      return;
    }
  }

  for (int i = 0; i < E; ++i) // 查看有没有空行
  {
    if (myCache[setindex_add][i].valid_bits == 0)
    {
      myCache[setindex_add][i].valid_bits = 1;
      myCache[setindex_add][i].tag = tag_add;
      myCache[setindex_add][i].stamp = 0;
      ++miss_count;
      return;
    }
  }
  // 没有空行又没有hit就是要替换了
  ++eviction_count;
  ++miss_count;

  for (int i = 0; i < E; ++i)
  {
    if (myCache[setindex_add][i].stamp > max_stamp)
    {
      max_stamp = myCache[setindex_add][i].stamp;
      max_stamp_index = i;
    }
  }
  myCache[setindex_add][max_stamp_index].tag = tag_add;
  myCache[setindex_add][max_stamp_index].stamp = 0;
  return;
}

void update_stamp()
{
  for (int i = 0; i < S; ++i)
    for (int j = 0; j < E; ++j)
      if (myCache[i][j].valid_bits == 1)
        ++myCache[i][j].stamp;
}
void freeAll(){
  for(int i=0;i<S;i++){
    free(myCache[i]);
  }
  free(myCache);
}

int main(int argc, char *argv[])
{
  h = 0;
  v = 0;
  hit_count = miss_count = eviction_count = 0;
  int opt; // getopt return value

  
  while (-1 != (opt = (getopt(argc, argv, "hvs:E:b:t:"))))
  {
    switch (opt)
    {
    case 'h':
      h = 1;
      printUsage();
      break;
    case 'v':
      v = 1;
      printUsage();
      break;
    case 's':
      s = atoi(optarg);
      break;
    case 'E':
      E = atoi(optarg);
      break;
    case 'b':
      b = atoi(optarg);
      break;
    case 't':
      strcpy(t, optarg);
      break;
    default:
      printUsage();
      break;
    }
  }

  if (s <= 0 || E <= 0 || b <= 0 || t == NULL) // 如果选项参数不合格就退出
    return -1;

  S = 1 << s; // S=2^s

  FILE *fp = fopen(t, "r");
  if (fp == NULL)
  {
    printf("open error");
    exit(-1);
  }

  init_cache();       // init cache
  fp = fopen(t, "r"); // get file name
  if (fp == NULL)
  {
    printf("open error");
    exit(-1);
  }

  char operation;       //  I L M S
  unsigned int address; 
  int size;        

  // int fscanf(FILE *stream, const char *format, ...)
  while (fscanf(fp, " %c %xu,%d\n", &operation, &address, &size) > 0)
  {

    switch (operation)
    {
    case 'I': continue;	   
    case 'L':
      loadData(address);
      break;
    case 'M':
      loadData(address); // store again if miss
    case 'S':
      loadData(address);
    }
    update_stamp(); 
  }

  fclose(fp);
  freeAll();
  printSummary(hit_count, miss_count, eviction_count);
  return 0;
}