#include "Statement.h"

Statement::Statement(int inputIndex, vector<Statement::var> &Vars)
    :index(inputIndex), vars(Vars),synTree(""){
}

Statement:: ~Statement(){

}

QString Statement::buildExpSynTree(string prefix){}

InputStmt::InputStmt(int inputIndex, QString varName1,int varVal1, vector<Statement::var> &Vars):
    Statement(inputIndex, Vars), varName(varName1), varVal(varVal1){
    stmt="INPUT "+varName1;
}

void InputStmt::buildSynTree(){


}

LetStmt:: LetStmt(int InputIndex, QString VarName, vector<Token> &expInputVec, vector<Statement::var> &Vars)
    :Statement(InputIndex, Vars),varName(VarName){
    stmt="LET "+VarName+" = " +expr;
    rightExp = new Exp(expr);
}

void LetStmt::buildSynTree(){
    //    160 LET =
    //        MAX
    //        100000
    synTree = QString::number(index) + "LET"+ buildExpSynTree(exp->postfix);
}

GotoStmt::GotoStmt(int inputIndex, int targetLineNum,vector<Statement::var> &Vars):
    Statement(inputIndex, Vars), targetNum(targetLineNum){
    stmt="GOTO "+QString::number(targetNum);
}
void GotoStmt::buildSynTree(){

}

IfStmt::IfStmt(int inputIndex, vector<Token> &expInputVec,  QString condition, vector<Token> &expInputVec1,
               int targetNum,vector<Statement::var> &Vars):Statement(inputIndex,Vars){
    leftExp = new Exp(expr);
    rightExp = new Exp(expr1);

}

void IfStmt::buildSynTree(){

}

PrintStmt::PrintStmt(int inputIndex, vector<Token> &expInputVec, vector<Statement::var> &Vars)
    :Statement(inputIndex, Vars){
    rightExp = new Exp(expr);
    stmt = "PRINT " + expr;
}

void PrintStmt::buildSynTree(){

}

RemStmt::RemStmt(int inputIndex, QString lineTmp, vector<Statement::var> &Vars)
    :Statement(inputIndex, Vars){
    stmt = "REM "+ lineTmp;
}

void RemStmt::buildSynTree(){

}

EndStmt::EndStmt(int inputIndex, vector<Statement::var> &Vars)
    :Statement(inputIndex, Vars){
    stmt = "END";
}

void EndStmt::buildSynTree(){

}






















