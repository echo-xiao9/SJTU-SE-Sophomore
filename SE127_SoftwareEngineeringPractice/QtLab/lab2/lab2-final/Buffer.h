#pragma once

#include <string>

using std::string;

class Buffer {
private:
    int currentLineNum;
    int lineNumber;//总行数
    
    // TODO: add a List here for storing the input lines
    struct line{
        string data;
        line *next;
        line(const string &x, line *n = NULL)    //line的有值的构造函数
        { data = x; next = n;}
        line( ):next(NULL) {}                      //line没有值的构造函数
        ~line() {
        }
    };
    line *head;
    line* nextBeforeInsert;
public:
    Buffer();
    ~Buffer();
    void writeToFile(const string &filename) const;
    const string &moveToLine(int idx)const ;
    void showLines(int from, int to) const;
    void deleteLines(int from, int to);
    void insertLine(const string &text);
    void appendLine(const string &text);
    int getLineNumber(){return lineNumber;}//返回总行数
    int getCurrentLineNum(){return currentLineNum;}
    void changeCurrentLineNum(int idx){currentLineNum=idx;}
    line* getLineptr(int idx)const;
    void saveNBI(int currentLineNum){
        nextBeforeInsert = getLineptr(currentLineNum);
    }
    void linkAfterInsert(){
        line*c = getLineptr(currentLineNum);
        c->next = nextBeforeInsert;
    }
};
