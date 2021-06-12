#pragma once

#include "kvstore_api.h"
#include "skipList.h"
#include "ssTable.h"
#include <cstring>
#include "utils.h"
#include "const.h"

using namespace::utils;
using namespace::std;
class keyValTime{
public:
    key_t key;
    string val;
    time_t stamp;
    keyValTime(key_t Key, string Val, time_t Stamp):key(Key),val(Val), stamp(Stamp){}
    keyValTime(){};
};

class SsMsg{
public:
    time_t stamp;
    num_t num;
    max_t max;
    min_t min;
    char fileName[100]="";
    char bloom[10245]="";
    vector<pair<key_t, off_t>> keyOff;
    SsMsg(
          time_t Stamp,
          num_t Num,
          max_t Max,
          min_t Min,
          const char* FileName,
          char Bloom[],
          vector<pair<key_t, off_t>> KeyOff
          ):stamp(Stamp),num(Num),max(Max),min(Min),keyOff(KeyOff){
        strcpy(fileName, FileName);
        strcpy(bloom, Bloom);
    }
    ~SsMsg(){
        keyOff.clear();
        vector<pair<key_t, off_t>>().swap(keyOff);
    }
};

class KVStore : public KVStoreAPI {
    // You can add your implementation here
private:
    // the number of files in every layer.
    int layerFiles[max_level]={0};
    // maxIndex+1 of every layer.
    int layerFilesIndex[max_level]={0};
    
    time_t curTime=1;
    int maxLayer;
//    vector<Front> frontList; // front stored in memory table. X
    vector<vector<SsMsg>> allSsMsg;
    vector<SsTable> memTable; // it will be delete after test!
    string fileDir;
    string getFileName(int layer, int num);
    string getDirName(int layer);
    bool fileExist(string fileDir);
public:
    Skiplist slmSkip;
    Skiplist slmSkipMerge;
    void updateMemTable();
    
    KVStore(const std::string &dir);
    
    ~KVStore(){
        allSsMsg.clear();
        memTable.clear();
    }
    
    void put(uint64_t key, const std::string &s) override;
    
    void putAgain(uint64_t key, const std::string &s,time_t stamp,int layer);
    
    
    std::string get(uint64_t key) override;
    
    bool del(uint64_t key) override;
    
    void recover();
    
    void reset() override;
    
    void writeToFile(SsTable &st,int layer);
    
    uint64_t  GetFileSize(const std::string& file_name);
    // return value if find the key in current sstable,"" not find,
    string readSstable(string &fileName,vector<keyValTime> &allKeyValTime,time_t &maxStamp, key_t targetKey, int needFind);
    
    
    void merge();
    void mergeSort(vector<keyValTime>&v,int isLastLayer);

    void mergeBoth(vector<keyValTime>&left,vector<keyValTime>&right, vector<keyValTime>&v, int isLastLayer);
    
    void mergeSstable(vector<string>&intersectionFile, max_t &maxKey, min_t &minKey, time_t &maxStamp,int targetLayer);
    
    void mergeFirstLayer();
    
    void mergeOtherLayer(int layer);
    
    bool checkLayer(int i); // return 1 if layer is overweight;
    int getBegin(int layer){
        return layerFilesIndex[layer]-layerFiles[layer];
    }
    bool checkInBloomFilter(key_t key, const char (&bloom)[10245]);
                                 
};
