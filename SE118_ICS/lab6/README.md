# ICS-lab6-Architecture

## Architecture

参考：

[CSAPP : Arch Lab 解题报告](https://zhuanlan.zhihu.com/p/36793761)

# 安装工具

```
# .make: flex：命令未找到
sudo apt-get install bison flex
```

# PartA

## 实现example.c

```bash
//example.c
/* 
 * Architecture Lab: Part A 
 * 
 * High level specs for the functions that the students will rewrite
 * in Y86-64 assembly language
 */
// 518431910002
// Yixiao Kang

/* $begin examples */
/* linked list element */
typedef struct ELE {
    long val;
    struct ELE *next;
} *list_ptr;

/* sum_list - Sum the elements of a linked list */
long sum_list(list_ptr ls)
{
    long val = 0;
    while (ls) {
	val += ls->val;
	ls = ls->next;
    }
    return val;
}

/* rsum_list - Recursive version of sum_list */
long rsum_list(list_ptr ls)
{
    if (!ls)
	return 0;
    else {
	long val = ls->val;
	long rest = rsum_list(ls->next);
	return val + rest;
    }
}

/* copy_block - Copy src to dest and return xor checksum of src */
long copy_block(long *src, long *dest, long len)
{
    long result = 0;
    while (len > 0) {
	long val = *src++;
	*dest++ = val;
	result ^= val;
	len--;
    }
    return result;
}
/* $end examples */
```

### **1. sum_list**

在`examples.c`中首先定义了一个链节点的结构体

```bash
*/* linked list element */***typedef** **struct** ELE {
    **long** val;
    **struct** ELE *****next;
} *****list_ptr;
```

```bash
sum_list函数对应的C代码如下所示，是对链表ls元素进行累加
```

```bash
**long** **sum_list**(list_ptr ls)
{
    **long** val **=** 0;
    **while** (ls) {
	val **+=** ls**->**val;
	ls **=** ls**->**next;
    }
    **return** val;
}
```

我们需要写一个Y86-64汇编程序对以下链表结构调用`sum_list`函数

```bash
  .align 8
ele1:
  .quad 0x00a
  .quad ele2
ele2:
  .quad 0x0b0
  .quad ele3
ele3:
  .quad 0xc00
  .quad 0
```

**注意：**链表是保存在内存中的，并且根据结构体`ELE`的声明，一个`ELE`实例在内存中的分布是8字节的`val`值以及8字节的`ELE *`值。

将以下代码保存到`sum.ys`中

```bash
# Execution begins at address 0
	.pos 0
	irmovq stack, %rsp  	# Set up stack pointer
	call main		# Execute main program
	halt			# Terminate program 

# 内存区域，存放数据/链表之类
# Sample linked list  // where is it??
.align 8
ele1:
    .quad 0x00a
    .quad ele2
ele2:
    .quad 0x0b0
    .quad ele3
ele3:
    .quad 0xc00
    .quad 0
# END

main:	
	irmovq ele1,%rdi  #参数准备
	call sum_list		# sum_list(ele1)
	ret

# long sum_list(list_ptr ls)
sum_list:
  xorq  %rax, %rax   # Store val in %rax, set it to 0
  jmp   test
loop:
  mrmovq 0(%rdi), %r10 # store val in %r10
  addq   %r10, %rax
  mrmovq 8(%rdi), %r8
  rrmovq %r8    , %rdi
test:
  andq  %rdi, %rdi   # Set cc according to the ls(in %rdi)
  jne  loop
  ret

# Stack starts here and grows to lower addresses
  .pos 0x200
stack:
```

结果

![ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-06_10.31.49.png](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-06_10.31.49.png)

2. rsum_list

通过递归调用求和

```bash
# /* rsum_list - Recursive version of sum_list */
# long rsum_list(list_ptr ls)
# {
#     if (!ls)
# 	return 0;
#     else {
# 	long val = ls->val;
# 	long rest = rsum_list(ls->next);
# 	return val + rest;
#     }
# }

   .pos 0
  irmovq stack, %rsp
  call main
  halt

  .align 8
ele1:
  .quad 0x00a
  .quad ele2
ele2:
  .quad 0x0b0
  .quad ele3
ele3:
  .quad 0xc00
  .quad 0

main:
  irmovq ele1,%rdi
  call rsum_list		# sum_list(ele1)
	ret

rsum_list:
  xorq  %rax, %rax   #  set ans to 0
  andq  %rdi, %rdi
  jne   L2
  ret
L2:
  pushq %r14
  mrmovq 0(%rdi), %r14 # val = ls->val
  mrmovq 8(%rdi), %rdi
  call rsum_list
  addq   %r14,   %rax
  popq  %r14
  ret

# Stack starts here and grows to lower addresses
  .pos 0x200
stack:
```

## copy.ys

```basic
# /* copy_block - Copy src to dest and return xor checksum of src */
# long copy_block(long *src, long *dest, long len)
# {
#     long result = 0;
#     while (len > 0) {
# 	long val = *src++;
# 	*dest++ = val;
# 	result ^= val;
# 	len--;
#     }
#     return result;
# }

# Execution begins at address 0
	.pos 0
	irmovq stack, %rsp  	# Set up stack pointer
	call main		# Execute main program
	halt			# Terminate program 

# 内存区域，存放数据/链表之类
.align 8
# Source block
src:
        .quad 0x00a
        .quad 0x0b0
        .quad 0xc00
# Destination block
dest:
        .quad 0x111
        .quad 0x222
        .quad 0x333
# END

main:	
	irmovq src, %rdi   # prepare parameter
  irmovq dest,%rsi  
  irmovq $3,  %rdx  
	call   copy_block		# long copy_block(long *src, long *dest, long len)
	ret

copy_block:
  pushq %r12
  pushq %r13
  pushq %r14
  xorq  %rax, %rax
  irmovq $8, %r14
  irmovq $1, %r13
  jmp   test
loop:
  mrmovq 0(%rdi), %r12  # long val = *src;
  addq   %r14, %rdi     # src++;
  rmmovq %r12, 0(%rsi)
  addq   %r14, %rsi     # dest++;
  xorq   %r12, %rax     # result ^= val;
  subq   %r13, %rdx     # len--;
test:
  andq  %rdx, %rdx   # Set cc according to the ls(in %rdx)
  jne  loop
  popq %r14
  popq %r13
  popq %r12
  ret

  # Stack starts here and grows to lower addresses
  .pos 0x200
stack:
```

![ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-06_10.29.07.png](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-06_10.29.07.png)

# Part B

unix> ./ssim -t ../y86-code/asumi.yo

如果失败尝试build asumi.yo

实现输出

![ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-07_12.53.46.png](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-07_12.53.46.png)

[seq-full](https://www.notion.so/seq-full-475e15bdc58f4ca29c6502b418a14e40)

# Part C

这里我们要做的就是修改 `sim/pipe/pipe-full.hcl` 以及 'sim/pipe/ncopy.ys' 的内容。使我们的程序运行效率尽量高。在为 `pipe-full.hcl` 实现完 `iaddq` 之后。我们就可以分别使用如下指令测试我们的代码：

`$ ./correctness.pl *#结果是否正确*
$ ./benchmark.pl *#得出效率，分数越高结果越好*`

测试正确性，注意还要写pipe-full.hcl

```basic
unix> (cd ../y86-code; make testpsim)
unix> (cd ../ptest; make SIM=../pipe/psim TFLAGS=-i)
```

![ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-07_10.28.27.png](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-07_10.28.27.png)

为什么两个不一样呢？

![ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-08_12.33.53.png](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-08_12.33.53.png)

[pipe-full.hcl](https://www.notion.so/pipe-full-hcl-a3ecfc660a86424ea9b79b30d9754b7c)

完成后的测试：

make drivers

make psim VERSION=full

cd ../ptest; 

make SIM=../pipe/psim TFLAGS=-i

cd ../pipe

./correctness.pl

./benchmark.pl

## 要做的事情

优化以下代码。ncopy函数将 整数数组src复制到不重叠的dst，重新转换src中包含的正整数数量的计数

![ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-07_7.35.56.png](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-07_7.35.56.png)

## 评判标准

CPE：cycles per element (CPE)。if the simulated code requires C cycles to copy a block of N elements, then the CPE is C/N.即单条指令需要的cycle.

### 源代码

```basic
int ncopy(int *src, int *dst, int len){
  int count=0;
  int val;
  while (len > 0) {
    val = *src++;
    *dst++ = val;
    if (val > 0)
      count++;
    len--; 
  }
    return count;
}
```

```basic
#/* $begin ncopy-ys */
##################################################################
# ncopy.ys - Copy a src block of len words to dst.
# Return the number of positive words (>0) contained in src.
#
# Include your name and ID here.
# 康艺潇 518431910002
# Describe how and why you modified the baseline code.
#

##################################################################
# Do not modify this portion
# Function prologue.
# %rdi = src, %rsi = dst, %rdx = len
ncopy:

##################################################################
# You can modify this portion
	# Loop header
	xorq %rax,%rax		# count = 0;
	andq %rdx,%rdx		# len <= 0?
	jle Done		# if so, goto Done:

Loop:	
  mrmovq (%rdi), %r10	# read val from src...
	rmmovq %r10, (%rsi)	# ...and store it to dst # data hazard
	andq %r10, %r10		# val <= 0?
	jle Npos		# if so, goto Npos:
	irmovq $1, %r10   #const %r10=1
	addq %r10, %rax		# count++

Npos:	irmovq $1, %r10
	subq %r10, %rdx		# len--
	irmovq $8, %r10   # store const %r10=8
	addq %r10, %rdi		# src++
	addq %r10, %rsi		# dst++
	andq %rdx,%rdx		# len > 0?
	jg Loop			# if so, goto Loop:
##################################################################
# Do not modify the following section of code
# Function epilogue.
Done:
	ret
##################################################################
# Keep the following label at the end of your function
End:
#/* $end ncopy-ys */
```

### 解答

[ ncopy.ys original](https://www.notion.so/ncopy-ys-original-a11693801ef64afdab4cb0902e520da5)

4路展开

[ncopy.ys ](https://www.notion.so/ncopy-ys-51c431a41e704d3ebebb9525f2b10aa9)

![ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-08_10.31.54.png](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-08_10.31.54.png)

改成8路展开

[ncopy2.ys](https://www.notion.so/ncopy2-ys-286e22afd4e84fc0b3a53b58f3fbaec2)

![ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-08_10.44.46.png](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-08_10.44.46.png)

修改了pipe-full.hcl，其中可以分支预测完美

[pipe-full.hcl](https://www.notion.so/pipe-full-hcl-d08b734b1fce414aabc41c1a73a531a7)

![ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-08_4.33.33.png](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/2021-04-08_4.33.33.png)

# score

[http://ipads.se.sjtu.edu.cn/courses/ics/labs/archlab/arch-score.html](http://ipads.se.sjtu.edu.cn/courses/ics/labs/archlab/arch-score.html)

# 参考文档

[ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/lab6.pdf](ICS-lab6-Architecture%20882faa608fc54c979e0c54e6c4d742da/lab6.pdf)

[CSAPP: Architecture Lab_未选之路-CSDN博客](https://blog.csdn.net/u012336567/article/details/51867766)

[CSAPP : Arch Lab 解题报告](https://zhuanlan.zhihu.com/p/36793761)

[csapp archlab 60分解答](https://zhuanlan.zhihu.com/p/77072339)

[csapp-Archlab](https://littlecsd.net/2019/01/18/csapp-Archlab/)