//
//  ssTable.hpp
//  lsm-lab-xcode
//
//  Created by 康艺潇 on 2021/4/25.
//

#ifndef ssTable_h
#define ssTable_h

#include <stdio.h>
#include <fstream>
#include <iostream>
#include <map>
#include "skipList.h"
using namespace std;

class OffAndVal{
    uint32_t offset;
    string s;
public:
    OffAndVal(uint32_t inputOff,string inputS):offset(inputOff), s(inputS){};
};


class SsTable{
private:
    //head 32B

    // if it can be insert,insert and return 1. If memory limit is reached after insert, return 0, do not insert.
    bool insert(const uint64_t& key, const string& val);
    void getBloomFilter();
public:
    uint64_t size;
    uint64_t sTime;
    uint64_t num;
    uint64_t curOff;
    int64_t max;
    int64_t min;
    // Bloom Filter 10KB;
    bool bloomFilter[10240]={0};
    vector<string> data;
    // index
    map<uint64_t, uint32_t> keyOff; //key and offset
    SsTable(uint64_t time, Skiplist &skipList);
//    uint64_t size(); //current byte
   
//    writeToFile(fstream file); //?
};


class Front{
private:
    //head 32B
    uint64_t sTime;
    uint64_t num;
    int64_t max;
    int64_t min;
    // Bloom Filter 10KB;
    bool bloomFilter[10240]={0};
    // index
    map<uint64_t, uint32_t> keyOff; //key and offset
public:
    Front(SsTable ssTable);
};
#endif /* ssTable_h */
