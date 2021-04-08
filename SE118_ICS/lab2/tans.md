




## fun7
```c++
fun7(string *str ,long ans)
if(rdi==nullptr)return -1;
else{
    if(*str>ans){
        &str=&str+8;
        result=fun7(str,ans);
        result*=2；
        return result;
    }else{
       if(*str == ans) {
           return 0;
       }else{
           str=str+16;//向后☞两个
           result =fun7(str,ans);
           result=2*result+1;
           retrun result;
        }
    }
}

the final retrun =7
```
