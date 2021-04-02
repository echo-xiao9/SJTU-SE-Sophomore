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
        var(QString name, int val): varName(name), varValue(val){}
    };
    Exp *exp;
    int index;
    QString stmt;
    vector<Statement::var> vars;
    // -1 means no type the type order from 0-6 is
    // 0:INPUT   1:LET   2:GOTO  3:IF   4:PRINT    5:REM   6:END
    int type = -1;
    Statement(int inputIndex, vector<Statement::var> &Vars, int Type);
    virtual void runSingleStmt()=0;
    ~Statement();
};


class InputStmt: public Statement{
public:
    QString varName;
    int varVal;
    InputStmt(int inputIndex, QString  varName1, int varVal1, vector<Statement::var> &Vars);
    void runSingleStmt();
};

class LetStmt: public Statement{
    QString varName;
    Exp *rightExp;
public:
    LetStmt(int InputIndex, QString VarName, QString expr,vector<Statement::var> &Vars);
    void runSingleStmt();
};

class GotoStmt: public Statement{
    int targetNum;
public:
    GotoStmt(int inputIndex, int targetLineNum,vector<Statement::var> &Vars);
    void runSingleStmt();
};

class IfStmt: public Statement{
private:
    Exp *leftExp;
    Exp *rightExp;
    QString inputExp;
    QString inputExp1;
    QString condtion;
    int targetNum;
public:
     IfStmt(int inputIndex, QString  exp,  QString inputCondition, QString exp1, int targetNum,vector<Statement::var> &Vars);
     void runSingleStmt();
};


class PrintStmt: public Statement{
public:
    Exp *rightExp;
    PrintStmt(int inputIndex, QString exp, vector<Statement::var> &Vars);
    void runSingleStmt();
};

class RemStmt: public Statement{
public:
    RemStmt(int inputIndex, QString lineTmp, vector<Statement::var> &Vars);
    void runSingleStmt();
};


class EndStmt: public Statement{
public:
    EndStmt(int inputIndex, vector<Statement::var> &Vars);
    void runSingleStmt();
};



#endif // STATEMENT_H
