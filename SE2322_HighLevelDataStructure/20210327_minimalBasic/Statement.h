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
    Statement(int inputIndex, QString inputStmt,vector<Statement::var> &Vars);
    ~Statement();

};

class RemStmt: public Statement{
public:
    RemStmt(int inputIndex, QString  inputStmt,vector<Statement::var> &Vars);
};

class LetStmt: public Statement{
    QString var;
    Exp *rightExp;
public:
    void  handleLetStmt();
    LetStmt(int inputIndex, QString  inputStmt,vector<Statement::var> &Vars);
};

class PrintStmt: public Statement{
public:
    Exp *rightExp;
    int value=0;
    PrintStmt(int inputIndex, QString  inputStmt,vector<Statement::var> &Vars);
};

class InputStmt: public Statement{
public:
    InputStmt(int inputIndex, QString  inputStmt,vector<Statement::var> &Vars);
    QString variable;
};

class GotoStmt: public Statement{
public:
    GotoStmt(int inputIndex, QString  inputStmt,vector<Statement::var> &Vars);
};
class IfStmt: public Statement{
public:
    IfStmt(int inputIndex, QString  inputStmt,vector<Statement::var> &Vars);
};

class EndStmt: public Statement{
public:
    EndStmt(int inputIndex, QString  inputStmt,vector<Statement::var> &Vars);
};




#endif // STATEMENT_H
