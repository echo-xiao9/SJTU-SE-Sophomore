#ifndef Exp_H
#define Exp_H
#include <string>
#include<stack>
#include <iostream>
#include <QString>
#include <QDebug>
using namespace std;

class Exp
{
public:
    string infix;
    string postfix;
    string prefix;
    int value;
    Exp(QString letexp);
    bool isOperator(char c);
    int getPriority(char C);
    string infixToPostfix();
    string infixToPrefix();
    int precedence(char op);
    int  applyOp(int a, int b, char op);
    int  evaluate();
};

class ExpException{
public:
    ExpException(){
        cout<<"Expression does not conform to the specification!"<<endl;
    }
};

#endif // Exp_H
