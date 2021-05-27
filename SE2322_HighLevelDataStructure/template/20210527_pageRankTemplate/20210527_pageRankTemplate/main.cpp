//
//  main.cpp
//  20210527_pageRankTemplate
//
//  Created by 康艺潇 on 2021/5/27.
//

template <typename T> struct Row{
int n;
T *rdata; Row(){
n = 0;
rdata = NULL; }
void set_row(int n, T *rdata){ assert(n > 0);
this->n = n;
this->rdata = rdata; }
T& operator[](int j){ assert(j >= 0 && j < n); return rdata[j];
} ~Row(){
rdata = NULL; }
template <typename T> class Matrix{ protected:
// m rows and n cols
    int m;
    int n;
    Row<T> *data;
public:
    Matrix(){
m = n = 0;
data = NULL; }
Matrix(int m, int n, const T *_data = NULL){ initialize(m, n, _data);
}
};
