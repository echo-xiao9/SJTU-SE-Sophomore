#include "Statement.h"
#include <QDebug>

Statement::Statement(int inputIndex,  int Type)
    :index(inputIndex),  type(Type){
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
    int flag1 = 0;
    int Parvalue= par.toInt();
    for (int i = 0; i < variables.size(); i++)
    {
        if(variables[i].varName == varName){
            variables[i].varValue = par.toInt();
            flag1=1;
            break;
        }
    }
    if(flag1==0){
        var newVar(varName, Parvalue);
        variables.push_back(newVar);
    }
    return "";
};

QString InputStmt::findVar(){
};

QString  InputStmt::tree(){
    return varName;
}

LetStmt::LetStmt(int InputIndex, QString VarName, QString expr)
    :Statement(InputIndex, 1),varName(VarName){
    stmt="LET "+VarName+" = " +expr;
    exp = new Exp(expr);
}

QString LetStmt::runSingleStmt(QString par){
    bool flag= false;
    exp->evaluate();
    for (auto it = variables.begin(); it != variables.end();it++) {
        if(it->varName == varName){
            it->varValue =exp -> value; //update the value of exist var
            flag = true;
            return "";
        }
    }
        var newVar(varName, exp->value);
        variables.push_back(newVar);
    return "";
}

QString  LetStmt::tree(){
    return varName ;
}

GotoStmt::GotoStmt(int inputIndex, int targetLineNum):
    Statement(inputIndex,2), targetNum(targetLineNum){
    stmt="GOTO "+QString::number(targetNum);
}

QString GotoStmt::runSingleStmt(QString par){
    //return the targetLine
    return QString::number(targetNum);
}

QString  GotoStmt::tree(){
    return QString::number(targetNum);
}

IfStmt::IfStmt(int inputIndex, QString  exp,  QString inputCondition, QString exp1, int TargetNum):
    Statement(inputIndex,3), inputExp(exp), inputExp1(exp1), condtion(inputCondition),targetNum(TargetNum){
    stmt = "IF "+inputExp+condtion+inputExp1+" THEN "+ QString::number(targetNum);
}

QString IfStmt::runSingleStmt(QString par){
    exp = new Exp(inputExp);
    exp1 = new Exp(inputExp1);
    exp->evaluate();
    exp1->evaluate(); //! 可能表达式出错
    if(condtion == "="){
        if(exp->value == exp1->value)return QString::number(targetNum);
    }
    else if(condtion == "<"){
        if(exp->value < exp1 ->value)return QString::number(targetNum);
    }else if(condtion == ">"){
        if(exp->value > exp1->value)return QString::number(targetNum);
    }
    return "-1";
}


PrintStmt::PrintStmt(int inputIndex, QString expr):Statement(inputIndex, 4){
    expStr = expr;
    exp = new Exp(expr);
    stmt = "PRINT " + expr;
}

QString PrintStmt::runSingleStmt(QString par){
    QString noVar= "can't find variable in print statement!";
    exp->evaluate();
    if(exp->value == -1)throw  noVar;
    return QString::number(exp->value);
}

QString  PrintStmt::tree(){
    return expStr;
}


RemStmt::RemStmt(int inputIndex, QString lineTmp):Statement(inputIndex,  5){
    stmt = "REM "+ lineTmp;
    remark=lineTmp;
    return;
}

QString RemStmt::runSingleStmt(QString par){}

QString  RemStmt::tree(){
    return remark;
}


EndStmt::EndStmt(int inputIndex):Statement(inputIndex, 6){
    stmt = "END";
}

QString EndStmt::runSingleStmt(QString par){return "";}

QString  EndStmt::tree(){return "";}

















