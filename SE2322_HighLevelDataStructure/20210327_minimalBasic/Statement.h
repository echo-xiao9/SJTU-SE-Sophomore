#ifndef STATEMENT_H
#define STATEMENT_H
#include <string>
#include <QString>
#include "Exp.h"
#include <vector>
using namespace std;



class Statement
{
public:
    struct var{
        QString varName="";
        int varValue=0;
    };
    Exp *exp;
    int index;
    QString stmt;
    vector<Statement::var> vars;
    Statement(int inputIndex, vector<Statement::var> &Vars);
    ~Statement();
};


class InputStmt: public Statement{
public:
    InputStmt(int inputIndex, QString  varName1, int varVal1, vector<Statement::var> &Vars);
    QString varName;
    int varVal;
};

class LetStmt: public Statement{
    QString varName;
    Exp *rightExp;
public:
    void  handleLetStmt();
    LetStmt(int InputIndex, QString VarName, QString expr,vector<Statement::var> &Vars);
};

class GotoStmt: public Statement{
    int targetNum;
public:
    GotoStmt(int inputIndex, int targetLineNum,vector<Statement::var> &Vars);
};

class IfStmt: public Statement{
private:
    Exp *leftExp;
    Exp *rightExp;

public:
     IfStmt(int inputIndex, QString  expr,  QString condition, QString expr1, int targetNum,vector<Statement::var> &Vars);
};

class PrintStmt: public Statement{
public:
    Exp *rightExp;
    PrintStmt(int inputIndex, QString exp, vector<Statement::var> &Vars);
};

class RemStmt: public Statement{
public:
    RemStmt(int inputIndex, QString lineTmp, vector<Statement::var> &Vars);
};


class EndStmt: public Statement{
public:
    EndStmt(int inputIndex, vector<Statement::var> &Vars);
};



#endif // STATEMENT_H
