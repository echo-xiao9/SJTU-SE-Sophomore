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
    const uint64_t SIMPLE_TEST_MAX = 512*100;
    const uint64_t LARGE_TEST_MAX = 30000 ;

    ofstream outfileTest;
    KVStore store("./data");

//    for (int i = 0; i < LARGE_TEST_MAX; ++i) {
//        store.put(i, std::string(i+1, 's'));
//    }
//    for(int i=0;i< LARGE_TEST_MAX;++i){
//        if(i==2029 || i==2875 )
//            cout<<i<<" error!"<<endl;
//        string val=store.get(i);
//        if(i==2029)
//        cout<<val.length()<<endl;
//        if(std::string(i+1, 's')!= val) cout<<"val:"<<val<<"i:"<<i<<endl;
//    }
////    if(std::string(i+1, 's')!= store.get(i))cout<<i<<endl;
//    cout<<"eng"<<endl;
    store.put(1, "s");
    store.put(1,"ss");
    cout<<store.get(1);
    return 0;
}
