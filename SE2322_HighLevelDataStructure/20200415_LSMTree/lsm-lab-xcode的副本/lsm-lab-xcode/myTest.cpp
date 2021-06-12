////
////  test.cpp
////  lsm-lab-xcode
////
////  Created by 康艺潇 on 2021/4/26.
////
#include <cstdint>
#include "const.h"
#include "kvstore.h"
#include "fstream"
#include "math.h"
using namespace::std;
int main(int argc, char *argv[])
{
    const uint64_t SIMPLE_TEST_MAX = 512*100;
    const uint64_t LARGE_TEST_MAX = 4000 ;
    int i=0;
    ofstream outfileTest;
    KVStore store("./data");
    store.reset();


    for (int i = 0; i < LARGE_TEST_MAX; ++i) {
        store.put(i, std::string(i+1, 's'));
    }
    //     Test after all insertions
//    for (int i = 0; i < LARGE_TEST_MAX; ++i)
//        //                EXPECT(std::string(i+1, 's'), store.get(i));
//        if(store.get(i)!=std::string(i+1, 's'))
//            cout<<i<<" "<<store.get(i)<<endl;
//
//

    for (i = 0; i < LARGE_TEST_MAX; i+=2)
        if(store.del(i)!=true)cout<<i<<endl;

//
    cout<<"OK for del"<<endl;
//    for (i = 0; i < LARGE_TEST_MAX; ++i){
//        if(i&1){
//            if(store.get(i)!=std::string(i+1,'s'))cout<<i<<endl;
//        }
//    }
    cout<<"OK for get"<<endl;
//        EXPECT((i & 1) ? std::string(i+1, 's') : not_found,
//               store.get(i));
////k
    for (i = 1; i < LARGE_TEST_MAX; ++i)
        if((i & 1)!=store.del(i))cout<<i<<endl;;

    cout<<"end!"<<endl;
    return 0;
}


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
