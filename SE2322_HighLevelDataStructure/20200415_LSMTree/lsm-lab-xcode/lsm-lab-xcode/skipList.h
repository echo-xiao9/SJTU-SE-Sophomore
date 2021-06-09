//
//  skipList.hpp
//  lsm-lab-xcode
//
//  Created by 康艺潇 on 2021/4/16.
//

#ifndef skipList_h
#define skipList_h

#include <stdio.h>
#include <vector>
#include <iostream>
#include <limits.h>
#include "MurmurHash3.h"
#include "const.h"

using namespace std;

struct Node{
    Node *right,*down;   //向右向下足矣
    uint64_t key=UINT_MAX-10;
    //set default key=UINT_MAX-10 problem??
    string val;
    Node(Node *right,Node *down, uint64_t key, string val): right(right), down(down), key(key), val(val){}
    Node(): right(nullptr), down(nullptr) {}
};


class Skiplist {
public:
    uint64_t num;
    uint64_t memSize;
    Node*head;
    Skiplist();
    void init();
    string get(const uint64_t& key);
    void put(const uint64_t& key, const string& val);
    bool remove(const uint64_t& key);
    int64_t getMax();
    int64_t getMin();
    Node* buttomHeadRight();
    ~Skiplist(){
        init();
        delete head;
    }
};



#endif /* skipList_h */
