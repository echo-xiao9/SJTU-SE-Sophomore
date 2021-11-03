//
//  const.h
//  OpenGLTest2
//
//  Created by 康艺潇 on 2021/10/29.
//

#ifndef const_h
#define const_h
#include <iostream>
using namespace::std;
const float errNum= -10000;
const int BUF_SIZE=800;
const float REC_WID=10;
const float REC_LEN = 180;
const float PI = 3.14159265;
bool mouseLeftDown;
bool mouseRightDown;
float mouseX, mouseY;
string overlapping="20   0 0  100    0 0  -20   50 20 1 0 0 0 1 0 0 0 1 0  20 0    0  100 0  -50  -20 20 1 0 0 0 1 0 0 0 1 -20   0 0 -100    0 0   20  -50 20 1 0 0 0 1 0 0 0 1 0 -20 0    0 -100 0   50   20 20 1 0 0 0 1 0 0 0 1";
string intersecting="0 0  0 100 0  0 100 100 20 1 0 0 0 1 0 0 0 1 0 0 20 100 0 20 100 100  0 0 1 0 0 0 1 1 0 0";
int type=0;
#endif /* const_h */
