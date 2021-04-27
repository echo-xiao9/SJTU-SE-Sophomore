#pragma once

#include "kvstore_api.h"
#include "skipList.h"
#include "ssTable.h"

using namespace std;


class KVStore : public KVStoreAPI {
    // You can add your implementation here
private:
    Skiplist slmSkip;
    uint64_t curTime=0;
    vector<Front> frontList; // front stored in memory table.
    vector<SsTable> memTable; // it will be delete after test!
    string fileDir;
public:
    void updateMemTable();
    
    KVStore(const std::string &dir);
    
    ~KVStore();
    
    void put(uint64_t key, const std::string &s) override;
    
    std::string get(uint64_t key) override;
    
    bool del(uint64_t key) override;
    
    void reset() override;
    
    void writeToFile(SsTable &st);
    
    uint64_t  GetFileSize(const std::string& file_name);
};
