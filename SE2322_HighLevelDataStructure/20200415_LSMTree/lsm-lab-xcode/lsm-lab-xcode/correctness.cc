//#include <iostream>
//#include <cstdint>
//#include <string>
//
//#include "test.h"
//
//class CorrectnessTest : public Test {
//private:
//    const uint64_t SIMPLE_TEST_MAX = 512;
//    const uint64_t LARGE_TEST_MAX = 4000;
//
//    void regular_test(uint64_t max)
//    {
//        uint64_t i;
//        store.reset();
//        int flag1,flag2,flag3=0;
//        // Test a single key
//        EXPECT(not_found, store.get(1));
//        store.put(1, "SE");
//        EXPECT("SE", store.get(1));
//        EXPECT(true, store.del(1));
//        EXPECT(not_found, store.get(1));
//        EXPECT(false, store.del(1));
//
//        phase();
//
//        // Test multiple key-value pairs
//        for (i = 0; i < max; ++i) {
//            store.put(i, std::string(i+1, 's'));
////            EXPECT(std::string(i+1, 's'), store.get(i));
//        }
//        phase();
//
//        // Test after all insertions
////        for (i = 0; i < max; ++i)
////            EXPECT(std::string(i+1, 's'), store.get(i));
////        phase();
//
//        cout<<"part1 begin"<<endl;
//        // Test deletions
//        for (i = 0; i < max; i+=2)
//            if(true!=store.del(i))
//                cout<<i<<" ";
//        cout<<"part1 OK"<<endl;
//
////        cout<<"part2 begin"<<endl;
////        for (i = 0; i < max; ++i){
////            if(i&1){
////                if(store.get(i)!=std::string(i+1, 's') )
////                    cout<<"part2 bug:"<<i<<endl;
////            }
////            else{
////                if(store.get(i)!="")
////                    cout<<"part2 bug:"<<i<<endl;
////            }
////        }
//
//
////            EXPECT((i & 1) ? std::string(i+1, 's') : not_found,
////                   store.get(i));
//        cout<<"part2 end"<<endl;
//        cout<<"part3 begin"<<endl;
//        for (i = 1; i < max; ++i){
//            if((i&1)!=store.del(i))
//                cout<<i<<endl;
//        }
////            EXPECT(i & 1, store.del(i));
//
//        phase();
//
//        report();
//    }
//
//public:
//    CorrectnessTest(const std::string &dir, bool v=true) : Test(dir, v)
//    {
//    }
//
//    void start_test(void *args = NULL) override
//    {
//        std::cout << "KVStore Correctness Test" << std::endl;
//
//        std::cout << "[Simple Test]" << std::endl;
//        regular_test(SIMPLE_TEST_MAX);
//
//        std::cout << "[Large Test]" << std::endl;
//        regular_test(LARGE_TEST_MAX);
//    }
//};
//
//int main(int argc, char *argv[])
//{
//    bool verbose = (argc == 2 && std::string(argv[1]) == "-v");
//
//    std::cout << "Usage: " << argv[0] << " [-v]" << std::endl;
//    std::cout << "  -v: print extra info for failed tests [currently ";
//    std::cout << (verbose ? "ON" : "OFF")<< "]" << std::endl;
//    std::cout << std::endl;
//    std::cout.flush();
//
//    CorrectnessTest test("./data", verbose);
//
//    test.start_test();
//
//    return 0;
//}
//
