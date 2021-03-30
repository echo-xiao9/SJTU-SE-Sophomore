#include "Statement.h"

Statement::Statement(int inputIndex, vector<Statement::var> &Vars)
    :index(inputIndex), vars(Vars){
}

Statement:: ~Statement(){

}

InputStmt::InputStmt(int inputIndex, QString varName1,int varVal1, vector<Statement::var> &Vars):
    Statement(inputIndex, Vars), varName(varName1), varVal(varVal1){
    stmt="INPUT "+varName1;
}

LetStmt::LetStmt(int InputIndex, QString VarName, QString expr,vector<Statement::var> &Vars)
    :Statement(InputIndex, Vars),varName(VarName){
    stmt="LET "+VarName+" = " +expr;
    rightExp = new Exp(expr);
}

GotoStmt::GotoStmt(int inputIndex, int targetLineNum,vector<Statement::var> &Vars):
    Statement(inputIndex, Vars), targetNum(targetLineNum){
    stmt="GOTO "+QString::number(targetNum);
}

IfStmt::IfStmt(int inputIndex, QString  expr,  QString condition, QString expr1, int targetNum,vector<Statement::var> &Vars):
    Statement(inputIndex,Vars){
    leftExp = new Exp(expr);
    rightExp = new Exp(expr1);

}

PrintStmt::PrintStmt(int inputIndex, QString expr, vector<Statement::var> &Vars):Statement(inputIndex, Vars){
    rightExp = new Exp(expr);
    stmt = "PRINT " + expr;
}

RemStmt::RemStmt(int inputIndex, QString lineTmp, vector<Statement::var> &Vars):Statement(inputIndex, Vars){
    stmt = "REM "+ lineTmp;
}

EndStmt::EndStmt(int inputIndex, vector<Statement::var> &Vars):Statement(inputIndex, Vars){
    stmt = "END";
}

void LetStmt::handleLetStmt(){
//        int found = stmt.indexOf("=");
//        if(found==-1)throw ExpException() ;
//        //divide the stmt.
//        var = stmt.mid(0,found);
//        QString letexp = stmt.mid(found,stmt.length()-found);
//        rightExp=new Exp(letexp);
}






















