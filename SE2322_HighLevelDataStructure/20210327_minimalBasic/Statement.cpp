#include "Statement.h"
#include <QDebug>

Statement::Statement(int inputIndex,  int Type)
    :index(inputIndex),  type(Type){
}

Statement:: ~Statement(){
}


InputStringStmt::InputStringStmt(int inputIndex,  QString varName1, QString  varVal1) :
    Statement(inputIndex, 0), varName(varName1), varVal(varVal1){
    stmt="INPUTS "+varName1;
}

QString InputStringStmt::runSingleStmt(QString par){
    int flag1 = 0;
    QString inputString = "\"" + par.trimmed() + "\"";
    for (int i = 0; i < variables.size(); i++)
    {
        if(variables[i].varName == varName){
            if(variables[i].type == 0){
            flag1=-1;
            throw QString("The variable type is a number, not a string!");
            }else{
                flag1=1;
                variables[i].varValue = par;
            }
        }
        if(flag1==0){
            var newVar(varName, inputString,1);
            variables.push_back(newVar);
        }
        return "";
    }
}
QString InputStringStmt::findVar(){}
QString InputStringStmt::tree(int i){ return varName;}





InputStmt::InputStmt(int inputIndex, QString varName1,int varVal1):
    Statement(inputIndex, 0), varName(varName1), varVal(varVal1){
    stmt="INPUT "+varName1;
}

QString InputStmt::runSingleStmt(QString par){
    int flag1 = 0;
    QString Parvalue= par.trimmed();
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

QString  InputStmt::tree(int i){
    return varName;
}

LetStmt::LetStmt(int InputIndex, QString VarName, QString expOrString, int inputType)
    :Statement(InputIndex, 1),letVarName(VarName),type(inputType){
    stmt="LET "+VarName+" = " +expOrString;
    if(type==0) exp = new Exp(expOrString);
    else{
        exp = nullptr;
        str = expOrString;
    }
}

QString LetStmt::runSingleStmt(QString par){
    bool flag= false;
    if(exp){
    exp->evaluate();
    for (auto it = variables.begin(); it != variables.end();it++) {
        if(it->varName == letVarName){
            if(it->type == 1)throw QString("The variable declared before was a number!");
            it->varValue =exp -> value; //update the value of exist var
            flag = true;
            return "";
        }
    }
    var newVar(letVarName, QString::number(exp->value),0);
    variables.push_back(newVar);
    }else{ // is a string
        for(auto it = variables.begin();it !=variables.end(); it++){
            if(it->varName == letVarName){
                if(it->type == 0)throw QString("The variable declared before was a string!");
                it->varValue = str;
                return "";
        }
    }
        var newVar(letVarName,str, 1);
        variables.push_back(newVar);
    return "";
    }
    return "";
}

QString  LetStmt::tree(int i){
    return letVarName ;
}

GotoStmt::GotoStmt(int inputIndex, int targetLineNum):
    Statement(inputIndex,2), targetNum(targetLineNum){
    stmt="GOTO "+QString::number(targetNum);
}

QString GotoStmt::runSingleStmt(QString par){
    //return the targetLine
    return QString::number(targetNum);
}

QString  GotoStmt::tree(int i){
    return QString::number(targetNum);
}

IfStmt::IfStmt(int inputIndex, QString  inputExp,  QString inputCondition, QString inputExp1, int TargetNum):
    Statement(inputIndex,3), inputExp(inputExp), inputExp1(inputExp1), condtion(inputCondition),targetNum(TargetNum){
    stmt = "IF "+inputExp+condtion+inputExp1+" THEN "+ QString::number(targetNum);
    exp = new Exp(inputExp);
    exp1 = new Exp(inputExp1);
}

QString IfStmt::runSingleStmt(QString par){
    exp->evaluate();
    exp1->evaluate();
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
    if(exp->value == -111111)throw  noVar;
    return QString::number(exp->value);
}

QString  PrintStmt::tree(int i){
    return expStr;
}


RemStmt::RemStmt(int inputIndex, QString lineTmp):Statement(inputIndex,  5){
    stmt = "REM "+ lineTmp;
    remark=lineTmp;
    return;
}

QString RemStmt::runSingleStmt(QString par){}

QString  RemStmt::tree(int i){
    return remark;
}

EndStmt::EndStmt(int inputIndex):Statement(inputIndex, 6){
    stmt = "END";
}

QString EndStmt::runSingleStmt(QString par){return "";}

QString  EndStmt::tree(int i){return "";}


ErrorStmt::ErrorStmt(int inputIndex, QString content):Statement(inputIndex, 7){
    stmt = content;
}

QString  ErrorStmt::tree(int i){return "Error";}











