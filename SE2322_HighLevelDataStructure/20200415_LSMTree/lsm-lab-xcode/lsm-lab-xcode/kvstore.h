#pragma once

#include "kvstore_api.h"
#include "skipList.h"
#include "ssTable.h"

using namespace std;

class keyValTime{
public:
    key_t key;
    string val;
    time_t stamp;
    
    keyValTime(key_t Key, string Val, time_t Stamp):key(Key),val(Val), stamp(Stamp){}
};

class SsMsg{
public:
    time_t stamp;
    num_t num;
    max_t max;
    min_t min;
    map<key_t, off_t> keyOff;
    SsMsg(time_t Stamp, num_t Num, max_t Max, min_t Min,map<key_t, off_t> KeyOff):stamp(Stamp),num(Num),max(Max),min(Min),keyOff(KeyOff){}
//    SsMsg(time_t Stamp, num_t Num, max_t Max, min_t Min):stamp(Stamp),num(Num),max(Max),min(Min){}
};

class KVStore : public KVStoreAPI {
    // You can add your implementation here
private:
    // the number of files in every layer.
    int layerFiles[20]={0};
    Skiplist slmSkip;
    Skiplist slmSkipMerge;
    time_t curTime=0;
//    vector<Front> frontList; // front stored in memory table. X
    vector<vector<SsMsg>> allSsMsg;
    vector<SsTable> memTable; // it will be delete after test!
    string fileDir;
    string getFileName(int layer, int num);
    bool fileExist(string fileDir);
public:
    void updateMemTable();
    
    KVStore(const std::string &dir);
    
    ~KVStore();
    
    void put(uint64_t key, const std::string &s) override;
    
    void putAgain(uint64_t key, const std::string &s,time_t stamp,int layer);
    
    
    std::string get(uint64_t key) override;
    
    bool del(uint64_t key) override;
    
    void reset() override;
    
    void writeToFile(SsTable &st,int layer);
    
    uint64_t  GetFileSize(const std::string& file_name);
    void merge();
    void mergeSort(vector<keyValTime>&v);
    void mergeBoth(vector<keyValTime>&left,vector<keyValTime>&right, vector<keyValTime>&v);
    void mergeSstable(vector<string>intersectionFile, max_t maxKey, min_t minKey, time_t maxStamp,int targetLayer);
    void mergeFirstLayer();
    void mergeOtherLayer(int layer);
    bool checkLayer(int i); // return 1 if layer is overweight;
    
                                 
};
