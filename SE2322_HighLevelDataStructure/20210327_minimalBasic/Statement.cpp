#include "Statement.h"

Statement::Statement(int inputIndex, vector<Statement::var> &Vars, int Type)
    :index(inputIndex), vars(Vars), type(Type){
}

Statement:: ~Statement(){

}

InputStmt::InputStmt(int inputIndex, QString varName1,int varVal1, vector<Statement::var> &Vars):
    Statement(inputIndex, Vars,0), varName(varName1), varVal(varVal1){
    stmt="INPUT "+varName1;
}

void InputStmt::runSingleStmt(){};

LetStmt::LetStmt(int InputIndex, QString VarName, QString expr,vector<Statement::var> &Vars)
    :Statement(InputIndex, Vars,1),varName(VarName){
    stmt="LET "+VarName+" = " +expr;
    rightExp = new Exp(expr);
}

void LetStmt::runSingleStmt(){
    bool flag= false;
    rightExp->evaluate();
    for (auto it = vars.begin(); it != vars.end();it++) {
        if(it->varName == varName){
            it->varValue =rightExp->value; //update the value of exist var
            flag = true;
    }
    }
    if(flag == false) {
        var newVar(varName, rightExp->value);
        vars.push_back(newVar);
    }
}


GotoStmt::GotoStmt(int inputIndex, int targetLineNum,vector<Statement::var> &Vars):
    Statement(inputIndex, Vars,2), targetNum(targetLineNum){
    stmt="GOTO "+QString::number(targetNum);
}

void GotoStmt::runSingleStmt(){}

IfStmt::IfStmt(int inputIndex, QString  exp,  QString inputCondition, QString exp1, int TargetNum,vector<Statement::var> &Vars):
    Statement(inputIndex,Vars,3), inputExp(exp), inputExp1(exp1), condtion(inputCondition),targetNum(TargetNum){
    stmt = "IF "+inputExp+condtion+inputExp1+" THEN "+ QString::number(targetNum);
}

void IfStmt::runSingleStmt(){}

PrintStmt::PrintStmt(int inputIndex, QString expr, vector<Statement::var> &Vars):Statement(inputIndex, Vars, 4){
    rightExp = new Exp(expr);
    stmt = "PRINT " + expr;
}

void PrintStmt::runSingleStmt(){}

RemStmt::RemStmt(int inputIndex, QString lineTmp, vector<Statement::var> &Vars):Statement(inputIndex, Vars, 5){
    stmt = "REM "+ lineTmp;
}

void RemStmt::runSingleStmt(){}

EndStmt::EndStmt(int inputIndex, vector<Statement::var> &Vars):Statement(inputIndex, Vars, 6){
    stmt = "END";
}

void EndStmt::runSingleStmt(){}




















