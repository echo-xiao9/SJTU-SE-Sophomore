//
//  test.cpp
//  lsm-lab-xcode
//
//  Created by 康艺潇 on 2021/4/26.
//

#include "kvstore.h"

int main(int argc, char *argv[])
{
    KVStore store("./data");
    for(int i=0;i<2*MB+1;i++)
        store.put(i,"test" );
    return 0;
}
