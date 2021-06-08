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
    Node*cur=head;
    Node*nextNode=nullptr;
    while (cur->down)cur=cur->down; //转到最底层
    cur=cur->right;
    while (cur&& cur->val!="") {
        if(!cur->right)nextNode=NULL;
        else nextNode=cur->right;
        remove(cur->key);
        cur=nextNode;
    }
    memSize=32+10*KB;
    num=0;
}

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

void Skiplist::put(const uint64_t& key, const string& val) {
    vector<Node*> pathList;    //从上至下记录搜索路径
    Node *p = head;
    //找到最底层的key值小于传入的key的节点
    while(p){
        while(p->right && p->right->key < key){
            p = p->right;
        }
        pathList.push_back(p);
        p = p->down;
    }
    bool insertUp = true;
    Node* downNode= nullptr;
    while(insertUp && pathList.size() > 0){   //从下至上搜索路径回溯，50%概率
        Node*insert = pathList.back();
        //vector.front() 、vector.back() 来得到 vector 首尾的值。
        pathList.pop_back();
        insert->right = new Node(insert->right, downNode, key, val); //add新结点
        downNode = insert->right;    //把新结点赋值为downNode
        insertUp = (rand()&1);   //50%概率
    }
    if(insertUp){  //插入新的头结点，加层
        Node* oldHead = head;
        head = new Node();
        head->right = new Node(NULL, downNode, key, val);
        head->down = oldHead;
    }
    num++;
    memSize+= 12+ val.length();
    return;
}

bool Skiplist::remove(const uint64_t& key) {
    bool flag=false;
    Node*cur = head;
    Node *pred,*target,*below ,*headBelow= nullptr;
    //repeat get(), but we need the position of the pred of the top deleted node
    
    while (cur) {
        while(cur->right && cur->right->key < key){
            cur = cur ->right;
        }
        if(cur->right && cur->right->key == key){
            flag=true;
            pred = cur;
            target = cur->right;
            below = target->down;
            while (target) {
                pred->right = target->right; //横向处理
                //寻找下一层的前继
                pred = pred->down;
                while (pred && pred->right && pred->right != below) {
                    pred=pred->right;
                }
                //如果塔高需要降低,考虑全部删完的情况,这时候不能把头给删掉了。
                if(!head->right && head->down){
                    headBelow=head->down;
                    delete head;
                    head = headBelow;
                }
                //纵向处理
                if(target==NULL){
                    cout<<"target is deleted!";
                }
                delete target;
                num--;
                target = below;
                if(target && target->down)below = target->down;
                else below = nullptr;
            }
        }
        if(flag==true)return true;
        cur = cur -> down;
    }
    return false;
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
