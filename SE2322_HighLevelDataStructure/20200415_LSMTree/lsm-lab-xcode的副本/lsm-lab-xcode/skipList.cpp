//
//  skipList.cpp
//  lsm-lab-xcode
//
//  Created by 康艺潇 on 2021/6/1.
//

#include <stdio.h>
#include "skipList.h"
using namespace::std;

Skiplist::Skiplist() {
    head = new Node();  //初始化头结点
    num=0;
    memSize = 32+10*KB;
}

void Skiplist::init(){
//    Node*cur=head;
//    Node*nextNode=nullptr;
//    while (cur->down)cur=cur->down; //转到最底层
//    cur=cur->right;
//    while (cur&& cur->val!="") {
//        if(!cur->right)nextNode=NULL;
//        else nextNode=cur->right;
//        remove(cur->key);
//        cur=nextNode;
//    }
    Node*cur=head;Node *delHead;
    while(cur){
        while (cur->right) {
            Node* del=cur->right;
            cur->right = del->right;
            delete del;
        }
        delHead=cur;
        cur=cur->down;
        delete delHead;
    }
    head=new Node();
    memSize=32+10*KB;
    num=0;
}

// x
string Skiplist::get(const uint64_t& key) {
    Node *cur = head; //There must be a node at the top layer
        while (cur) {
            while(cur->right && cur->right->key <= key){
                cur = cur ->right;
            }
            if(cur->key == key)
                return (cur->val);
            cur = cur -> down;
        }
    return "";
}
// x
void Skiplist::put(const uint64_t& key, const string& val) {
    /*返回false代表插入新值，返回true代表覆盖原值*/
    std::vector<Node*> pathList;    //从上至下记录搜索路径
    Node *p = head;
    while(p){
        while(p->right && p->right->key < key){
            p = p->right;
        };
        /*如果已经存在key则用value进行覆盖*/
        if (p->right && p->right->key == key) {
            p = p->right;
            memSize = memSize - (p->val).size() + val.size();
            while (p) {
                p->val = val;
                p = p->down;
            };
            return ;
        };
        pathList.push_back(p);
        p = p->down;
    }

    bool insertUp = true;
    Node* downNode= nullptr;
    while(insertUp && pathList.size() > 0){   //从下至上搜索路径回溯，50%概率
        Node *insert = pathList.back();
        pathList.pop_back();
        insert->right = new Node(insert->right, downNode, key, val); //add新结点
        downNode = insert->right;    //把新结点赋值为downNode
        insertUp = (rand() & 1);   //50%概率
    }
    if(insertUp){  //插入新的头结点，加层
        Node *oldHead = head;
        head = new Node();
        head->right = new Node(NULL, downNode, key, val);
        head->down = oldHead;
    }

    num++;
    memSize+= 12+ val.length();
    return;
}

bool Skiplist::remove(const uint64_t& key) {
    Node *p = head;
    Node *tmp = nullptr;
    bool flag = false;
    while (p) {
        while (p->right && p->right->key < key) {
            p = p->right;
        }
        /*如果右节点值相等*/
        if (tmp != nullptr) {
            while (p->right != tmp)
                p = p->right;
        }

        if (p->right && p->right->key == key) {
            flag = true;
            tmp = p->right;
            p->right = tmp->right;

            tmp = tmp->down;
            if (!head->right && head->down) head = head->down;
        }
        p = p->down;
    }
    return flag;
}

int64_t Skiplist::getMax(){
    Node*cur=head;
    while (cur->down)cur=cur->down; //turn to buttom.
    if(cur->right ==nullptr || cur==nullptr)throw "empty skiplist!";
    while (cur->right) {
        cur = cur->right; //turn to the max.
    }
    return cur->key;
}
int64_t Skiplist::getMin(){
    Node*cur=head;
    while (cur->down)cur=cur->down; //turn to buttom.
    if(cur->right ==nullptr || cur==nullptr)throw "empty skiplist!";
    return cur->right->key;
}
Node* Skiplist::buttomHeadRight(){
    Node*cur=head;
    while (cur->down)cur=cur->down; //turn to buttom.
    return cur->right;
}

Skiplist::~Skiplist(){
//    Node*cur=head;Node *delHead;
//    while(cur){
//        while (cur->right) {
//            Node* del=cur->right;
//            cur->right = del->right;
//            delete del;
//        }
//        delHead=cur;
//        cur=cur->down;
//        delete delHead;
//    }
    init();
    delete head;
}
