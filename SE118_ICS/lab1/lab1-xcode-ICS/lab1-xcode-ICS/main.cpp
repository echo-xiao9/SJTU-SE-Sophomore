//
//  main.cpp
//  lab1-xcode-ICS
//
//  Created by 康艺潇 on 2020/10/28.
//

#include <iostream>
using namespace std;
int bang(int x) {
  x = x|(x>>16);
  x = x|(x>>8);
  x = x|(x>>4);
  x = x|(x>>2);
  x = x|(x>>1);
  int y = x ^(0x1);
  int z=y&0x1;
  return z;
}
int copyLSB(int x) {
    int y=-(x<<31)>>31;
    return y;
}
int evenBits(void) {
    int x=0x00000055;
    x =x|x<<8;
    x =x|x<<16;
  return x;
}

//int divpwr2(int x, int n) {
//    int negx = ~(x-1);
//    int negxdivpw2 = negx>>n;
//    int ans= ~negxdivpw2+1;
//    return ans;
//}


void fun(int n,int num,int data)
{
    if(n == 0) return;
    printf("%c",(num&data ? '1' : '0'));
    num <<= 1;
    if((n - 1)%4==0)
    {
        printf(" ");
    }
 
    fun(n-=1,num,data);}

void BinaryRecursion(int n)
{
    int a;
    a = n % 2; // 取余
    n = n >> 1;  //右移一位 相当于除以2
    if(0 != n)
    {
        BinaryRecursion(n);
    }
    cout<<a;
}

/*
 思路： 负数和正数>>n其实是函数floor（x/(2^n)）,题目是要向0取整，即负数时应该是
 ceil(x/(2^n)),ceil 和floor的转化为ceil(x) = floor(x+(2^n-1)/2^n)
 即( x + (2<<n +(~0)))>>n 这里特别注意，2前面的括号。
 */
int divpwr2(int x, int n) {
int negMask = x>>31;
int ceilToFloor =((1<<n) + ~0);
int ans = (x + (negMask & ceilToFloor))>>n;
return ans;
}

/*
 这种方法使用的符号略多。
 判定正确的条件：从后往前数n位，在这之前，正数不可以出现1，负数不可以出现0，
 同时n位和n-1位不可以同号，eg0110虽然是3位前面就没有了1，但是需要4位表示
 最后考虑边界情况n=32,或一个flag.
 */
int fitsBits(int x, int n) {
int nMask=(~0)<<n;
int changeX = (x>>31)^x;
int flag1 =! (x>>n)^(x>>(n+(~0)));
int flag2 = n>>5;
return flag2|((!(nMask & changeX))&flag1) ;
}
//better solution:若满足，则先将它左移32-n,再右移32-n 结果应该一样。
//int fitsBits(int x, int n)  // 6 ops
//{
//    int m = 33 + ~n;  // => 32 + (~n + 1) => 32 - n
//    int x_as_n_bit = (x << m) >> m;
//    return !(x ^ x_as_n_bit);  // x == x_as_n_bit
//}


int getByte(int x, int n) {
    int mask=0xFF;
    mask = mask <<(8*n);
    x = x & mask;
    x = x>>(8*n)&0xFF;
    return x;
}
/*分三种情况考虑：
 1.x,y同号，-y=~y+1,sum=x-y,即判定sum的正负
 2.x>=0, y<=0 sum会爆掉，但是直接判定可以
 3.x<=0,y>=0,直接判定不可以。
 特别注意是括号多的时候要小心。
*/
int isGreater(int x, int y) {
int negY = ~y +1;
int sum = x+ negY;
int flag1 = (!(x>>31))&(y>>31); //flag1=1 if x>0 and y<0
int flag2 = !((x>>31)&!(y>>31)); //flag2=0 if x<0 and y>0
int flag3 = !(!sum);            //flag2=1 if x != y
int flag4 = (!(sum>>31))&0x1;   //flag3=1 if  x-y<0;
int result = flag1 |(flag2 & flag3 & flag4);
return result;
}
int isNonNegative(int x) {
    int mask=0x1;
    mask = mask<<31;
    int tmp = x & mask;
    return !tmp;
}
int isPower2(int x) {
    int m1 = 0x11 | (0x11 << 8);
    int mask = m1 | (m1 << 16);
    int s = x & mask;
    s += x>>1 & mask;
    s += x>>2 & mask;
    s += x>>3 & mask;
    
    /* Now combine high and low order sums */
    s = s + (s >> 16);
    /* Low order 16 bits now consists of 4 sums.
     Split into two groups and sum */
    mask = 0xF | (0xF << 8);
    s = (s & mask) + ((s >> 4) & mask);
    int tmp= (s + (s>>8)) & 0x3F;// the num of 1
    int flag=~x+1-x;            //To rule out 0x80000000
    int tmp2 =(!(tmp-1))&flag;
    int flag2 = !(x-1);
    int ans =tmp2|flag2;
    return ans;
}
//思路：利用x和~x 相加一定为0
int isNotEqual(int x, int y) {
    int fanx = ~x;
    int tmp = ~(fanx + y);
    
    return (!(!tmp));
}
//思路：x&(~x)一定是0，取反后+1，原来是0的地方1+1进位向前传递
int leastBitPos(int x) {
    int mask=x &( ~x+1);
    return mask;
}
int setBitNumber(int n)
{
    // Below steps set bits after
    // MSB (including MSB)
  
    // Suppose n is 273 (binary
    // is 100010001). It does following
    // 100010001 | 010001000 = 110011001
    n |= n >> 1;
  
    // This makes sure 4 bits
    // (From MSB and including MSB)
    // are set. It does following
    // 110011001 | 001100110 = 111111111
    n |= n >> 2;
  
    n |= n >> 4;
    n |= n >> 8;
    n |= n >> 16;
    // Increment n by 1 so that
        // there is only one set bit
        // which is just before original
        // MSB. n now becomes 1000000000
        n = n + 1;
      
        // Return original MSB after shifting.
        // n now becomes 100000000
        return (n >> 1);
    }
//思路：对第一位单独处理，然后再算数右移
int logicalShift(int x, int n) {
int mask = 0x1;
mask = mask<<31;
int flag = (mask & x);//get the first num 0f x.
x=(x>>1)^(flag);//use ^ if the first num 0f x==1 change ,else keep 0
x = x>>(n-1);
return x;
}


/*
 思路：三种可能：1.返回sum(没有溢出) 2. 返回0x7fffffff,正向溢出
 3.返回0x80000000,负向溢出。关键点在于如何用一个式子表示出三种可能性
 技巧： 表示条件
 //int codition =0 or 1，if condition ->B else ->C
 mask_condition = condition >> 31;//右移31位也可产生31个1
 mask_condition & B |~ mask_condition & c
 注意：0x80000000右移会变成全1
 */
int satAdd(int x, int y) {
int sum = x + y;
int flag2 = (x>>31)^(sum>>31); //若sum 和 x 同号，flag2=0,异=1，可能发生了overflow
int flag3 = (y>>31)^(sum>>31);//若sum 和 y 同号，flag3=0,异=1，可能发生了overflow
int notOverFlowMask = (~(flag2 & flag3))>>31;// flag4=0 sum 和x,y都异号，发生overflow
int overFlowResult = x >>31 ^(~(0x1<<31)); //if x>=0, overflowResult = 0x7fffffff,else = 0x80000000
int ans = (notOverFlowMask & sum)|(~notOverFlowMask & overFlowResult);
return ans;
}

/*
 sign-magnitude 即为用第一个位作为符号位，剩下的取绝对值
 重点：2‘s complement 和 sign-magnitude的关联：
      2‘s 的除掉第一位取反+1 就是 sign-ma的值，然后再把符号位附上
 技巧：同satAdd ,都需要条件的表示。
 */
int tc2sm(int x) {
int negMask = x>>31;//if x<0,mask全1，else 0x0
int ansOfNeg = (~x+1)^(0x1<<31);
int ans = (negMask & ansOfNeg)|(~negMask & x);
return ans;
}


int main(int argc, const char * argv[]) {
    cout<<divpwr2(0x80000004, 27)<<endl;
}
