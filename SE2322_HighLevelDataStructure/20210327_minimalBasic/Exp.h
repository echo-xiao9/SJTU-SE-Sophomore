#ifndef Exp_H
#define Exp_H
#include <string>
#include<stack>
#include<vector>
#include <iostream>
#include <QString>
#include <QDebug>
#include "MainWindow.h"
using namespace std;

class Exp
{
private:
   vector<Token> inputVec;
   vector<Token> postfixVec;
public:
//    string input;
    string infix;
    string postfix;
    bool valid;
//    string prefix;
    int value;
    Exp(vector<Token> &expInputVec);
    void gettPostfix();
//    bool isOperator(char c);
    int getPriority(QString C);
    string infixToPostfix();
//    string infixToPrefix();
//    int precedence(char op);
//    int  applyOp(int a, int b, char op);
    int  evaluate();
};

class ExpException{
public:
    ExpException(){
        cout<<"Expression does not conform to the specification!"<<endl;
    }
};

#endif // Exp_H
