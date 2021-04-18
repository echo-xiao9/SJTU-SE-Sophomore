# ICS-lab2

## 授课

[](https://www.notion.so/ad744d4553174e2f989cac136886699e)

### 要求：

要先看文件！！不要直接双击,双击二进制文件直接扣分，必须要在命令行下完成。

学号文件+bomb文件 要求输入key(不定长的字符串)

一共65分，每个face10分

4次💥扣一分

成绩由45min在线考试考完，3+1个

理解操作，反推key

有一个参数-s ？？拆炸弹的过程中是要向端发送（看文档仔细！）

注意，不要改bump 的参数，它发送会有固定的格式

### 工具

GDB

OBJDUMP

打印汇编并计算

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_10.52.05.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_10.52.05.png)

## 文件执行

```basic
$./bomb
input password:123
bomb!...
$
$./bomb
input password:224
survive!
```

```basic
objdump -D bomb > asm
得到反汇编文件
找到main 函数的位置
开始读汇编
先找jump,call 了解大致结构
```

## GDB

设置断点：cmp bomb call 打印password

资料

-r 运行

-r answer.txt （把answer.txt）作为输入运行

b phase_2 在phase_2的函数名下设置断点。

disas 查看这部分的反汇编

[https://blog.csdn.net/qq_43690043/article/details/84207902](https://blog.csdn.net/qq_43690043/article/details/84207902)

si 下一条

i r 查看寄存器内容

until *[地址]                  eg.until *0000000000400ff6

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-08_8.39.40.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-08_8.39.40.png)

x/d [内存地址] :查看地址中的元素值

## 输出文件

objdump -D bomb > bomb.s 输出汇编代码文件

xxd bomb > bomb.hex 输出16进制文件，可以查看数据

strings bomb 看bomb中所有的string

### 输入答案

gdb r answet.txt

### phase_1

## 注

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-11_2.05.38.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-11_2.05.38.png)

1个byte 代表一个字母

这边是数据区域，所以后面的反汇编是没用的，要看前面的数字

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-11_2.04.47.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-11_2.04.47.png)

从25开始 25 64 20 25 64 一直读到0为止，所以一共是%d %d 

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-11_2.06.47.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-11_2.06.47.png)

```cpp
00002310: 5468 6520 626f 6d62 2068 6173 2062 6c6f  The bomb has blo
```

在数据段区域查找是找个大致的，然后去数数，找到对应的数字，在hex文件去读，一直读到00为止，因为字符串以0 结尾

### phase_2

arg1(%rdi) → input

arg2(%rsi) →  &x                 mov %rsp, %rsi,所以是局部变量的地址

一步步写出来发现是在做阶乘。

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-11_1.53.23.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-11_1.53.23.png)

**void read_six_numbers()**

传参：

rdi

rsi ← rsp

rdx ←rsp ← rsi

rcx ←4+rsp← 4+ rsi

r8 ← 8+rsp←8 + rsi

r9 ← 12+rsp←12 + rsi

找出原型

```cpp
int sscanf( const char * s, const char * format,int a,int b,..
```

发现没有%rdi,所以传入的第一个参数就是用来做这个输入，推断

然后会把s 输出到a,b里面，具体是什么格式输出，那要看format.

```cpp
00002320: 776e 2075 702e 0025 6420 2564 2025 6420  wn up..%d %d %d 
00002330: 2564 2025 6420 2564 0045 7272 6f72 3a20  %d %d %d.Error:
```

读取数据得到6个%d  所以

```cpp
void read_six_numbers(char*s){
	const char *format = "%d %d %d %d %d %d";//格式化输出
}
```

## phase_3

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.32.54.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.32.54.png)

这里的sscanf又是放了标准库，搞明白怎么用的了

```cpp
int sscanf( const char * s, const char * format,char* a,int* b,..
```

读到对应的后面几个地址里面

发现没有%rdi,所以传入的第一个参数就是用来做这个输入，推断

然后会把s 输出到a,b里面，具体是什么格式输出，那要看format.

这里把0x8(%rsp)为第一个参数，0xc(%rsp)第二个，查询了之后看到format 是%d,%d,确实符合两个。

这里关于rsp的传参顺序，rsp先－，然后传入rsp+a,a从大到小，a=c（%rsp）b=8(%rsp)

至于eax到底放什么不太清楚。但是后来发现总是2（i r）？

接下来对于0xc(%rsp)进行参数范围判断，发现总是[0,7],刚好是8个。

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_9.38.02.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_9.38.02.png)

在内存文件中读取rax,然后加到rdx上面，得到新的rax根据指令号进行跳转。每次跳转会把一个新的值放到rax 然后把8（%rdi）和这个参数比较，不相等就explode那么说明8(%rdi)就是这个值。

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.28.08.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.28.08.png)

这里其实真正做出来是靠disas ,i r, x/d [%rsp]去看寄存器，然后看结果···

## phase_4

这个比较简单，但是不知道的是传入几个参数的判断即需要输入几个数字，这里一看其实只用到了c(%rsp),所以先尝试了一个，得到结果

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_12.35.23.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_12.35.23.png)

查看sscanf的format，就是rsi的402336

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_12.36.32.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_12.36.32.png)

在hex文件里面查找从25 64 00 45 开始

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_12.37.17.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_12.37.17.png)

得到的是两个%d

**func4**

这个函数是递归函数，带入几个值发现是在做阶乘。传入参数n ，得到的结果rax=n! 注意push 是保存，每次pop的时候就取出保存的覆盖该寄存器的值，eg pop rbx 就是把rbx用pop的值覆盖了。所以是要一一对应，顺序别错。

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_1.18.02.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_1.18.02.png)

## phase_5

callee saved register dsdc89不离十

caller saved register %rbx %rbp %r12 %r13 %r14 %r15

xor %eax ,%eax 就是%eax=0

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_9.09.39.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_9.09.39.png)

### 寻找对比的隐藏数据数组数组

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.33.42.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.33.42.png)

找对应的编码，在hex文件找字符

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.34.55.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.34.55.png)

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.37.24.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.37.24.png)

找到为ravens刚好6个,注意到，hex文件的前面的编码就是去掉.s文件去掉40

### =input产生的数组，反解input

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.26.05.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.26.05.png)

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.29.49.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.29.49.png)

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.40.00.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-12_11.40.00.png)

设&str = 402000

 str = isrveawhobpnutfg   result= ravens

之后计算偏移量。eg,r是对应的地址为 402000+ 2*1 所以0xf & input[i]=2

2 5 3 4 11 1    查找ascii码

答案（多个）：2534K1

## phase_6

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_9.08.52.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_9.08.52.png)

strtol()

[https://www.runoob.com/cprogramming/c-function-strtol.html](https://www.runoob.com/cprogramming/c-function-strtol.html)

[https://blog.csdn.net/zxx2096/article/details/81127858](https://blog.csdn.net/zxx2096/article/details/81127858)

long int strtol(const char *nptr, char **endptr, int base)

> strtol()会将nptr指向的字符串，根据参数base，按权转化为long int, 然后返回这个值。
参数base的范围为2~36,和0；它决定了字符串以被转换为整数的权值。
可以被转换的合法字符依据base而定，举例来说，当base为2时，合法字符为‘0’，‘1’；base为8时，合法字符为‘0’，‘1’，……‘7’；base为10时，合法字符为‘0’，‘1’，……‘9’；base 为16时，合法字符为‘0’，‘1’，……‘9’，‘a’，……‘f’；base为24时，合法字符为‘0’，……‘9’，‘a’，……‘n’，base为36时，合法字符为‘0’，……‘9’，‘a’，……‘z’；等等。其中，不区分大小写，比如，‘A’和‘a’会都会被转化为10。
当字符合法时，‘0’，……‘9’依次被转换为十进制的0～9，‘a’，……‘z’一次北转换为十进制的10～35。
strtol()函数检测到第一个非法字符时，立即停止检测，其后的所有字符都会被当作非法字符处理。合法字符串会被转换为long int, 作为函数的返回值。非法字符串，即从第一个非法字符的地址，被赋给*endptr .**endptr是个双重指针，即指针的指针。strtol()函数就是通过它改变*endptr的值，即把第一个非法字符的地址传给endptr。

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_9.19.19.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_9.19.19.png)

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_9.19.32.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_9.19.32.png)

大小端？

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_10.25.48.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_10.25.48.png)

[https://stackoverflow.com/questions/36754994/binary-bomb-phase-6](https://stackoverflow.com/questions/36754994/binary-bomb-phase-6)

这关直接没看汇编，因为返回值的rax直接可以用 i r查看，并且x/d直接看内容发现是

## secrete phase

进入，直接用gdb查看比较后的寄存器结果，然后输入

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_3.04.30.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_3.04.30.png)

&str=603670

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_5.06.43.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_5.06.43.png)

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_5.35.49.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_5.35.49.png)

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_5.50.04.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-13_5.50.04.png)

## jyz_bomb

### phase_1

![ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-23_3.02.21.png](ICS-lab2%2020d4bcda7c7d4390a7e133cf48f28894/2020-12-23_3.02.21.png)

1. 直接看rsi里面的地址对应的字符串，在hex文件中找到即可。