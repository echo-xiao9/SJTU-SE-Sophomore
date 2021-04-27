//
//  test.cpp
//  lsm-lab-xcode
//
//  Created by 康艺潇 on 2021/4/26.
//

#include "kvstore.h"
#include "fstream"
int main(int argc, char *argv[])
{
    ofstream outfileTest;
    outfileTest.open("testMB",ios::out);
    KVStore store("./data");
    
    for(int i=0;i<2*MB+1;i++){
        store.put(i,"a");
        outfileTest<<i<<' ';
    }
    return 0;
}
