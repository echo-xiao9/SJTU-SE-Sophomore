//
//  main.cpp
//  20210527_pageRankTemplate
//
//  Created by 康艺潇 on 2021/5/27.
//
#include <iostream>
using namespace::std;

template <typename T> struct Row{
    int n;
    T *rdata; Row(){
        n = 0;
        rdata = NULL;
    }
    void set_row(int n, T *rdata){ assert(n > 0);
        this->n = n;
        this->rdata = rdata; }
    T& operator[](int j){ assert(j >= 0 && j < n); return rdata[j];
    } ~Row(){
        rdata = NULL; }
};

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
    void initialize(int m, int n, const T *_data){
        // ensure parameter _m and _n are all valid
        assert(m > 0 && n > 0); this->m = m;
        this->n = n;
        T *buf;
        assert((buf = (T*)calloc(m * n, sizeof(T))) != NULL); if(_data){
            memcpy(buf, _data, sizeof(T) * m*n); }
        // allocate memory for each row in a matrix
        assert((data = new Row<T>[m]) != NULL); for(int i = 0; i < m; ++i){
            data[i].set_row(n, buf+i*n); }
    }
    
    Matrix(const Matrix<T> &other){
        if(&other == this)return;
        this->m = other.row_size();
        this->n = other.col_size();
        // empty, don't need to copy data if(m <= 0 || n <= 0)return; initialize(m, n, NULL);
        for(int i = 0; i < m; ++i){ for(int j = 0; j < n; ++j){
            data[i][j] = other[i][j];
        }
        }
        
    }
    
    Row<T>& operator[](int i) const{ assert(i >= 0 && i < m);
        return data[i];
    }
    
    
    
    Matrix operator*(const Matrix<T> &other){
        // precondtion
        assert(n == other.row_size());
        // res is result to be returned
        int res_col = other.col_size();
        // create res to store result
        Matrix<T> res(m, res_col); for(int i = 0; i < m; ++i){
            for(int j = 0; j < res_col; ++j){ res[i][j] = 0;
                // matrix A, B: sum of aik * bkj, k from 1 to n
                for(int k = 0; k < n; ++k){
                    res[i][j] += data[i][k] * other[k][j]; }
            } }
        // overload operator=
        return res;
        
    }
    
    
    
    
    void operator+=(const Matrix<T> &other){
        // allow add itself
        if(m != other.row_size() || n != other.col_size())return; assert(m > 0 && n > 0 && data != NULL);
        for(int i = 0; i < m; ++i){
            for(int j = 0; j < n; ++j){
                data[i][j] += other[i][j];
            }
        }
    }
    
    // avoid shadow copy
    void operator=(const Matrix<T> &other){
        if(&other == this)return;
        // this is not empty
        if(this->m != 0){
            clear();
        }
        this->m = other.row_size(); this->n = other.col_size();
        // empty, don't need to copy data
        if(m <= 0 || n <= 0)return; initialize(m, n, NULL);
        for(int i = 0; i < m; ++i){
            for(int j = 0; j < n; ++j){
                data[i][j] = other[i][j];
            }
        }
    }
    int main(int argc, char * argv[]){
        int row1 = 6;
        int col1 = 6;
        Matrix<float> H(row1, col1, H_arr); // H.print();
        float R_arr[] = {0.2, 0.2, 0.2, 0.2, 0.2,0.2};
        int row2 = 6;
        int col2 = 1;
        Matrix<float> R(row2, col2, R_arr);
        // basic way
        for(int i = 1; i <= iters; ++i){
            Matrix<float> res = H * R;
            printf("iter %d res is :\n", i);
            res.print();
            R = res;
            
        }
        
        
        
        
