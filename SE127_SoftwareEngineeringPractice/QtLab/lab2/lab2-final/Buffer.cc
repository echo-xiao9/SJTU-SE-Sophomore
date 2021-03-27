#include <fstream>
#include <iostream>
#include "Buffer.h"
using namespace std;
//TODO: your code here
//implement the functions in ListBuffer

Buffer::Buffer() {
    head = new line;
    lineNumber=0;
    currentLineNum=0;
}

Buffer::~Buffer() {
    line*pos,*next;
    pos = head;
    while (pos->next !=NULL) {
        next=pos->next;
        delete pos;
        pos = next;
    }
    delete pos;
}

void Buffer::writeToFile(const string &filename) const {
    ofstream outfile(filename);
    int byte=0;
    if(!outfile)cerr<<"Can not output file'\n'"<<endl;
    line*l = head->next;
    for (int i=0; i<lineNumber; i++) {
        outfile<<l->data<<'\n';
        byte+=l->data.length()+1;
        l=l->next;
    }
    
    printf("%d byte(s) written", byte);
    cout<<endl;
    outfile.close();
}

void Buffer::showLines(int from, int to) const {
    
    for (int i=from; i<=to; i++) {
        cout<<i<<'\t'<<moveToLine(i)<<endl;
    }
    
}

void Buffer::deleteLines(int from, int to){
    line*prev=getLineptr(from-1);
    line*del=prev->next;
    if (to==lineNumber && from==0) {
        currentLineNum=0;
    }
    else{
        if (to==lineNumber) {
            currentLineNum = from-1;
        }
        else{
            currentLineNum = from;
        }
    }
    for (int i=from; i<=to; i++) {
        prev->next=del->next;
        delete del;
        del=prev->next;
        lineNumber--;
    }
}

void Buffer::insertLine(const string &text){
    line*prev = getLineptr(currentLineNum-1);
    line*current = prev->next;
    line*insertLine = new line(text,current);
    prev->next= insertLine;
    lineNumber++;
}

void Buffer::appendLine(const string &text){
    line*currentLine = getLineptr(currentLineNum);
    line*ap= new line(text);
    if (getLineptr(currentLineNum+1)) {
        ap->next = getLineptr(currentLineNum+1);
    }
    currentLine->next =ap;
    
    currentLineNum++;
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



