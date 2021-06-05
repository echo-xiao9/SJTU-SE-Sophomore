//
//  test.cpp
//  lsm-lab-xcode
//
//  Created by 康艺潇 on 2021/4/26.
//
#include "const.h"
#include "kvstore.h"
#include "fstream"
int main(int argc, char *argv[])
{
    try{
    ofstream outfileTest;
    outfileTest.open("testMB",ios::out);
    KVStore store("./data");
    
    for(int i=MB;i>0;i++){
        store.put(i,"a");
        outfileTest<<i<<' ';
    }}catch(string s){
        cout<<s<<endl;
    }
    return 0;
}
