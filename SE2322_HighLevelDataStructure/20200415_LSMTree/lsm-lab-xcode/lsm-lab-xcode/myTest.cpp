//////
//////  test.cpp
//////  lsm-lab-xcode
//////
//////  Created by 康艺潇 on 2021/4/26.
//////
#include <cstdint>
#include "const.h"
#include "kvstore.h"
#include "fstream"
#include "math.h"
using namespace::std;
int main(int argc, char *argv[])
{
    const uint64_t SIMPLE_TEST_MAX = 512*10;
    const uint64_t LARGE_TEST_MAX = 4000 ;
    int i=0;
    ofstream outfileTest;
    KVStore store("./data");
    store.reset();

    for (int i = 0; i < LARGE_TEST_MAX; ++i) {
        store.put(i, std::string(i+1, 's'));
    }
    for (int i = 0; i < LARGE_TEST_MAX; ++i) {
        store.del(i);
    }
    
    cout<<"first stage"<<endl;
    for(int i=0;i<LARGE_TEST_MAX;i++){
        if(store.get(i)!=""){
            cout<<"error"<<i<<' '<<store
            .get(i).length()<<endl;
        }
    }
    
    
    cout<<"second stage"<<endl;

    for (int i = 0; i < LARGE_TEST_MAX; ++i) {
        store.put(i, std::string(i, 's'));
    }

    for(int i=0;i<LARGE_TEST_MAX;i++){
        if(store.get(i)!=std::string(i, 's')){
            cout<<"error"<<i<<' '<<store
            .get(i).length()<<endl;
        }
    }


//    for (i = 0; i < LARGE_TEST_MAX; ++i){
//        if(i&1){
//            if(store.get(i)!=std::string(i+1,'s'))cout<<i<<endl;
//        }
//    }
    cout<<"OK for get"<<endl;
//        EXPECT((i & 1) ? std::string(i+1, 's') : not_found,
//               store.get(i));
////
    for (i = 1; i < LARGE_TEST_MAX; ++i)
        if((i & 1)!=store.del(i))cout<<i<<endl;;

    cout<<"end!"<<endl;
    return 0;
}
//
//
//
//int main(){
//    Skiplist *skp;
//    skp=new Skiplist();
//    for(int i=0;i<10;i++)
//        skp->put(i%3, to_string(i));
//    for(int i=0;i<10;i++)
//        cout<<skp->remove(i%3);
//    cout<<endl;
//    for(int i=0;i<10;i++)
//        if(skp->get(i)=="")cout<<"NO"<<endl;
//        else cout<<skp->get(i)<<endl;
//
//    cout<<endl;
//
//}
