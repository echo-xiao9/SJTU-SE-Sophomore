//
//  ssTable.cpp
//  lsm-lab-xcode
//
//  Created by 康艺潇 on 2021/4/25.
//
#include "ssTable.h"
#include "MurmurHash3.h"
//uint64_t sTime;
//uint64_t num;
//int64_t max;
//int64_t min;
//// Bloom Filter 10KB;
//char bloomFilter[10240]={0};

SsTable::SsTable(uint64_t time, Skiplist &skipList):sTime(time){
    keyOff.clear();
    data.clear();
    string curData="";
    Node* cur = nullptr;
    num = min = max = 0;
    if(skipList.size()==0) return;
    cur = skipList.buttomHeadRight();
    min = cur->key;
    while (cur && cur->right && insert(cur->key, cur->val)) {
        skipList.remove(cur->key);
        cur = cur->right;
    }
    max = cur->key;
    insert(cur->key, cur->val);
    skipList.remove(cur->key);
    return;
}

uint64_t SsTable::size(){
    //Head: 32B Bloom Filter: 10KB key: 8B offset: 4B
    uint64_t frontSize = 32+10*KB+12*num;
    uint64_t dataSize =frontSize;
    for(auto it=data.begin();it!=data.end();it++)
    dataSize+= (*it).length();
    return dataSize;
}
bool SsTable::insert(const uint64_t& key, const string& val){
    // 2Mb=1048576B if size>2Mb, cancel insert and return 0;else insert key offset data and return 1;
    num++;
    data.push_back(val);
    if(size() > 2*MB){
        // More than limit
        num--;
        data.pop_back();
        return false;
    }
    keyOff.insert(make_pair(key, curOff));
    //update offSet
    curOff += val.length();
  
    return true;
}
void SsTable::getBloomFilter(){
    // bloomFilter[10240]
    uint32_t hash[4] = {0};
    for(auto it=keyOff.begin();it!=keyOff.end();it++){
        uint64_t key = it->first;
        MurmurHash3_x64_128(&key, sizeof(key), 1, hash);
        for(int i=0;i<4;i++) bloomFilter[hash[i] % 10240]=1;
    }
}

Front::Front(SsTable ssTable){
    sTime = ssTable.sTime;
    num = ssTable.num;
    max = ssTable.max;
    min = ssTable.min;
    for(int i=0;i<10240;i++)
    bloomFilter[i] = ssTable.bloomFilter[i];
    keyOff = ssTable.keyOff;
}
