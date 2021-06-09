////
////  test.cpp
////  lsm-lab-xcode
////
////  Created by 康艺潇 on 2021/4/26.
////
//#include "const.h"
//#include "kvstore.h"
//#include "fstream"
//#include "math.h"
//using namespace::std;
//int main(int argc, char *argv[])
//{
//    const uint64_t SIMPLE_TEST_MAX = 512*100;
//    const uint64_t LARGE_TEST_MAX = 4000 ;
//
//    ofstream outfileTest;
//    KVStore store("./data");
//    store.reset();
//
//
//    for (int i = 0; i < LARGE_TEST_MAX; ++i) {
//        store.put(i, std::string(i+1, 's'));
//    }
//    //     Test after all insertions
//    for (int i = 0; i < LARGE_TEST_MAX; ++i)
//        //                EXPECT(std::string(i+1, 's'), store.get(i));
//        if(store.get(i)!=std::string(i+1, 's'))
//            cout<<i<<" "<<store.get(i)<<endl;
//    cout<<"end!"<<endl;
//    return 0;
//}
