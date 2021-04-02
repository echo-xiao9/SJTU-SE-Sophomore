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
    QString synTree;
    vector<Statement::var> vars;
    Statement(int inputIndex, vector<Statement::var> &Vars);
    ~Statement();
    virtual void buildSynTree()=0;
    QString buildExpSynTree(string prefix);
};


class InputStmt: public Statement{
public:
    InputStmt(int inputIndex, QString  varName1, int varVal1, vector<Statement::var> &Vars);
    QString varName;
    int varVal;
    void buildSynTree();
};

class LetStmt: public Statement{
    QString varName;
    Exp *rightExp;
public:
    LetStmt(int InputIndex, QString VarName, vector<Token> &expInputVec, vector<Statement::var> &Vars);
     void buildSynTree();
};

class GotoStmt: public Statement{
    int targetNum;
public:
    GotoStmt(int inputIndex, int targetLineNum,vector<Statement::var> &Vars);
     void buildSynTree();
};

class IfStmt: public Statement{
private:
    Exp *leftExp;
    Exp *rightExp;

public:
     IfStmt(int inputIndex, vector<Token> &expInputVec,  QString condition, vector<Token> &expInputVec1, int targetNum,vector<Statement::var> &Vars);
      void buildSynTree();
};

class PrintStmt: public Statement{
public:
    Exp *rightExp;
     void buildSynTree();
    PrintStmt(int inputIndex, vector<Token> &expInputVec, vector<Statement::var> &Vars);
};

class RemStmt: public Statement{
public:

    void buildSynTree();
    RemStmt(int inputIndex, QString lineTmp, vector<Statement::var> &Vars);
};


class EndStmt: public Statement{
public:
    void buildSynTree();
    EndStmt(int inputIndex, vector<Statement::var> &Vars);
};



#endif // STATEMENT_H
