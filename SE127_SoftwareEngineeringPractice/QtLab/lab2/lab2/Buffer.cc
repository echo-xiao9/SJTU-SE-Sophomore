#include <fstream>
#include <iostream>
#include "Buffer.h"
using namespace std;
//TODO: your code here
//implement the functions in ListBuffer

Buffer::Buffer() {
    head = new line;
    lineNumber=0;
}

Buffer::~Buffer() {
    line*pos,*next;
    while (pos->next !=NULL) {
        next=pos->next;
        delete pos;
        pos = next;
    }
    delete pos;
}

void Buffer::writeToFile(const string &filename) const {}

void Buffer::showLines(int from, int to) const {

}

void Buffer::deleteLines(int from, int to){}

void Buffer::insertLine(const string &text){
    line*prev = getLineptr(currentLineNum);
    line*current = prev->next;
    line*insertLine= new line(text,current);
    prev->next= insertLine;
    lineNumber++;
}

void Buffer::appendLine(const string &text){
    line*nextLine = getLineptr(currentLineNum+1);
    line*ap= new line(text,nextLine);
    lineNumber++;
}


const string &Buffer::moveToLine(int idx) const {
    line*ptr=head;
    for (int i=0;i<idx;i++) {
        ptr=ptr->next;
    }
    return ptr->data;
}

Buffer::line* Buffer::getLineptr(int idx)const{
    line *s=head;
    for(int i=0;i<idx;i++){
        s=s->next;
    }
    return s;
}



