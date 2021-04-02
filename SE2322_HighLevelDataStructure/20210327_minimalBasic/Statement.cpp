#include "Statement.h"
#include <QDebug>

Statement::Statement(int inputIndex,  int Type)
    :index(inputIndex),  type(Type){
    qDebug()<<"new var:";
    //遍历方式3，采用下角标进行数据元素访问
    for (size_t i = 0; i < variables.size(); i++)
    {
    qDebug() << variables[i].varName<<endl;
    }
}

Statement:: ~Statement(){

}

InputStmt::InputStmt(int inputIndex, QString varName1,int varVal1):
    Statement(inputIndex, 0), varName(varName1), varVal(varVal1){
    stmt="INPUT "+varName1;
}

QString InputStmt::runSingleStmt(QString par){
    int flag = 0;
    for (int i = 0; i < variables.size(); i++)
    {
        if(variables[i].varName == varName){
            variables[i].varValue = par.toInt();
            flag=1;
            break;
        }
    }
    if(flag==0)throw "variable undefined";

};

QString InputStmt::findVar(){

//    else return varName;
};

LetStmt::LetStmt(int InputIndex, QString VarName, QString expr)
    :Statement(InputIndex, 1),varName(VarName){
    stmt="LET "+VarName+" = " +expr;
    rightExp = new Exp(expr);

}

QString LetStmt::runSingleStmt(QString par){
    bool flag= false;
    rightExp->evaluate();

    for (auto it = variables.begin(); it != variables.end();it++) {
        if(it->varName == varName){
            it->varValue =rightExp->value; //update the value of exist var
            flag = true;
            return "";
        }
    }
        var newVar(varName, rightExp->value);
        variables.push_back(newVar);
    return "";
}


GotoStmt::GotoStmt(int inputIndex, int targetLineNum):
    Statement(inputIndex,2), targetNum(targetLineNum){
    stmt="GOTO "+QString::number(targetNum);
}

QString GotoStmt::runSingleStmt(QString par){
    //return the targetLine
    return QString::number(targetNum);
}

IfStmt::IfStmt(int inputIndex, QString  exp,  QString inputCondition, QString exp1, int TargetNum):
    Statement(inputIndex,3), inputExp(exp), inputExp1(exp1), condtion(inputCondition),targetNum(TargetNum){
    stmt = "IF "+inputExp+condtion+inputExp1+" THEN "+ QString::number(targetNum);
}

QString IfStmt::runSingleStmt(QString par){}

PrintStmt::PrintStmt(int inputIndex, QString expr):Statement(inputIndex, 4){
    rightExp = new Exp(expr);
    stmt = "PRINT " + expr;
}

QString PrintStmt::runSingleStmt(QString par){}

RemStmt::RemStmt(int inputIndex, QString lineTmp):Statement(inputIndex,  5){
    stmt = "REM "+ lineTmp;
}

QString RemStmt::runSingleStmt(QString par){}

EndStmt::EndStmt(int inputIndex):Statement(inputIndex, 6){
    stmt = "END";
}

QString EndStmt::runSingleStmt(QString par){}




















