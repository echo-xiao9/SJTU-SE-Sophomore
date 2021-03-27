
```c++
bool strings_not_equal(string *s1,string *s2) 比较两个指针对应的字符串是否相等。
__isoc99_sscanf   //返回值rax是读入了几个数字
```
## Phase2 

char* a

rsi = rsp
r12 = rsp -> rsp+0xc =  &a[3]
ebp = 0                 ->a[0]
r13 = rsp
eax = *(rsp+0xc)=a[3]
rbx = rsp               ->&a[1]
eax = *(rsp+0xc)


*(rsp +0xc) = *rsp  ->a[3]=a[0]
cmp    %r12,%rbx    ->a[1]=a[0]
test   %ebp,%ebp    -> a[0]!=0

## phase3
先读两个数字到

0xc(%rsp) = a ->rdx 
0x8(%rsp) = b ->rcx
eax = a
rdx = 402040
rax = 402040 + *(402040+ 4a)
eg a=0;   *402040 =  fffff057
=401097
ans =140

eg a=3; *40204c =fffff099
ans =  然后一系列操作


### 整个的关键是  4010c9:	3b 44 24 08          	cmp    0x8(%rsp),%eax
所以做题方法是：先输入一个<5 的数字和任意的数字，然后gdb就可以了


## phase_5
```c++
length =6
rax = rbx =rdi= &a[0] = &a[1]
rdi = a[6];
ecx = 0;
while(&a[i] != a[6]){
    ecx +=  *(402060 + 4* (a[i]& 0x0f));
}

注意这里的a[i]是要用ascii 码 如a ->0x61 0x61&0x0f= 0x1

ecx = 0x2f = 47;
}


eeee5b

5 ->402080



55552














