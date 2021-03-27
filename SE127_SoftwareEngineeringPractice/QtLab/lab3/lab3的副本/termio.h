#pragma once
/* some code from Libconio 1.0 (C) 2004 FSL A.C. */

#ifdef _WIN32
#include <conio.h>
#include <stdio.h>
#include <string.h>
static void clrscr()
{
    system("cls");
}
#else
#include <termios.h>
#include <stdio.h>
#define ESC 033 /* Escape char */

static int getch()
{
    struct termios t;
    int c;
    tcgetattr(0, &t);
    t.c_lflag &= ~ECHO + ~ICANON;
    tcsetattr(0, TCSANOW, &t);
    fflush(stdout);
    c = getchar();
    t.c_lflag |= ICANON + ECHO;
    tcsetattr(0, TCSANOW, &t);
    return c;
}

static void clrscr()
{
    printf("%c[2J", ESC);
    printf("%c[%d;%dH", ESC, 0, 0);
}
#endif

#include <iostream>
#include <cstring>
using namespace std;
struct disk
{
    int size=0;
    disk(int Size):size(Size) {}
    disk(){size=0;}
};
class myStack{
public:
    disk* elem;
    int num=0;
    int top_p;
    myStack(){
        elem = new disk[5];
        top_p = -1;
    }
    
    void push(const disk &d){
        elem[++top_p] = d;
    }
    disk pop(){
        disk d =elem[top_p];
        elem[top_p--].size = 0;
        return d;}
    int size_of_top(){return elem[top_p].size;}
};

class cmd{
public:
    int from;
    int to;
    cmd(int From,int To):from(From),to(To){};
    cmd(){from =0;to=0;};
};

class cmdStack{
private:
    cmd elem1[100];
public:
    int top_p;
    cmdStack(){
        top_p = -1;
    }
    void push(const cmd &d){
        elem1[++top_p] = d;
    }
    cmd pop(){return elem1[top_p --];}
};

class Termio
{
public:
    // donot change the width and height
    static const int CANVAS_WIDTH = 41;
    static const int CANVAS_HEIGHT = 11;
    static char buffer[CANVAS_HEIGHT][CANVAS_WIDTH + 1];
    myStack tower[3];
    Termio(int n){
        for(int i=1;i<=3;i++)tower[i-1].num = i;
        for (int i=n;i>0;i--){
            tower[0].push(i);
        }
    }
    ~Termio(){
        for(int i=0;i<3;i++) tower[i].~myStack();
    }
  // void change_array();
   bool judge(int n){
       if(tower[1].top_p == n-1) return true;
       else return false;
   }
   void move(int from,int to){
       disk d ;
       d= tower[from-1].pop();
       tower[to-1].push(d);
   }
    static char GetChar() {
        return getch();
    }

    static void Clear() {
        clrscr();
    }

    static void Draw() {
        for (int i = 0; i < CANVAS_HEIGHT; i++)
        {
            buffer[i][CANVAS_WIDTH] = '\0';
            cout << buffer[i] << endl;
        }
    }

    static void ResetBuffer() {
        for (int i = 0; i < CANVAS_HEIGHT; i++)
            memset(buffer[i], ' ', CANVAS_WIDTH);
    }
    
    void write_hi() {
        int center[3]={5,20,35};
        for(int m=0;m<=CANVAS_WIDTH;m++){
            buffer[CANVAS_HEIGHT-1][m]='-';
        }
        for(int m=0;m<=CANVAS_HEIGHT;m++){
            for (int n=0;n<3; n++) {
                buffer[m][center[n]]='|';
            }
        }
          
        for(int i=0;i<3;i++){
            int layers = tower[i].top_p+1;
            //Go through disks
            for(int j=0;j<layers;j++){
                //draw disks from buttom
                int drawLayers =CANVAS_HEIGHT- 2*j - 2;
                //draw every disk
                for(int k = - tower[i].elem[j].size;k<=tower[i].elem[j].size;k++)
                buffer[drawLayers][center[i]+k] = '*';
            }
        }
    }
    void prepareAndDraw(){
        Clear();
        ResetBuffer();
        write_hi();
        Draw();
    }
    bool compare(int from,int to){
        if(tower[from].top_p == -1)return false;
        if (tower[to].top_p ==-1)return  true;
        return (tower[from].size_of_top()<tower[to].size_of_top());
    }
    void hanoi(int n, myStack t1, myStack t2, myStack t3) {
        // move n disks from rod A to rod B, use rod C as a buffer
        if(n==0)return;
        hanoi(n - 1,t1,t3,t2);
        move(t1.num, t2.num); // move the nth disk from rod A to rod B haoni(n - 1, C, B, A);
        cout << "Auto moving:"<<t1.num<<"->"<<t2.num << endl;
        prepareAndDraw();
        hanoi(n - 1,t3,t2,t1);
        return;
    }

};
