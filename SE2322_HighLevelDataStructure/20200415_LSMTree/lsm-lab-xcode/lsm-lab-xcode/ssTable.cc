//
//  ssTable.cpp
//  lsm-lab-xcode
//
//  Created by 康艺潇 on 2021/4/25.
//
#include "ssTable.h"
#include "MurmurHash3.h"

SsTable::SsTable(uint64_t time, Skiplist &skipList):sTime(time){
    keyOff.clear();
    data.clear();
    string curData="";
    Node* cur = nullptr;
    num=0;
    num = min = max = 0;
    size=32+10240;
    curOff = 0;
    if(skipList.num==0) return;
    cur = skipList.buttomHeadRight();
    min = cur->key;
    while (cur && cur->right && insert(cur->key, cur->val)) {
        cur = cur->right;
    }
    max = cur->key;
    insert(cur->key, cur->val);
    getBloomFilter();
    for(auto it =keyOff.begin();it!=keyOff.end();it++){
        it->second+=32+10240+num*12;
    }
    return;
}

bool SsTable::insert(const uint64_t& key, const string& val){
    // 2Mb=1048576B if size>2Mb, cancel insert and return 0;else insert key offset data and return 1;
    num++;
    data.push_back(val);
    uint64_t prevSize=size;
    size += 12 + val.length();
    if(size > 2*MB){
        // More than limit
        num--;
        size = prevSize;
        data.pop_back();
        return false;
    }
    keyOff.push_back(make_pair(key, curOff));
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

