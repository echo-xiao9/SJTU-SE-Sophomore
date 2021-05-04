#include "Statement.h"
#include <QDebug>

Statement::Statement(int inputIndex,  int Type)
    :index(inputIndex),  type(Type){
    // 0: INPUTS,1:INPUT, 2：LET, 3：GOTO, 4:IF,  5:PRINTF, 6: PRINT， 7:REM, 8:END,9:THEN
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
    Statement(inputIndex, 1), varName(varName1), varVal(varVal1){
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
    :Statement(InputIndex, 2),letVarName(VarName),type(inputType){
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
    Statement(inputIndex,3), targetNum(targetLineNum){
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
    Statement(inputIndex,4), inputExp(inputExp), inputExp1(inputExp1), condtion(inputCondition),targetNum(TargetNum){
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

PrintfStmt::PrintfStmt(int inputIndex, QString inputStr):Statement(inputIndex, 5){
    stmt = "PRINTF "+ inputStr;
    str = inputStr;
}

parse_t Statement::parse_string(QString &ptr, QString &inputString){
    QString tmp = ptr;
    tmp= tmp.trimmed();
    int tail=0;
    if(tmp[0]=="\'"){
        if(tmp.indexOf("\"")!=-1)return PARSE_ERR;
        tail = tmp.indexOf("\'",1);
        if(tail== -1)return PARSE_ERR;
        inputString = tmp.mid(0, tail);
        ptr = tmp.mid(tail+1);
        return PARSE_STR;
    }
    else if(tmp[0]== "\""){
        if(tmp.indexOf("\'") !=-1)return PARSE_ERR;
        tail = tmp.indexOf("\"",1);
        if(tmp.indexOf("\"",1) == -1)return PARSE_ERR;
        inputString = tmp.mid(0, tail);
        ptr = tmp.mid(tail+1);
        return PARSE_STR;
    }
    return PARSE_ERR;
}

QString PrintfStmt::runSingleStmt(QString par){ // PRINTF "Mini Basic V {}", 2
    replacePair.clear();
    QStringList list1 = str.split(QLatin1Char(','));
    base = list1[0].trimmed();
    base=base.mid(1,base.length()-2);
    QString target;
    bool isNum=1;
    int i=0; int replacementIndex=1;
    QString inputStr="";
    // build the replace pair
    if(list1.length()>1)target =  list1[replacementIndex].trimmed();
    while(i<base.length()){
        isNum=1;
        qDebug()<<base[i]<<"i:"<<i<<endl;
        if(base[i]=='{'){
            if(base[i+1]!= '}')throw QString("Single { !");
            else {
                if(replacementIndex >=list1.size() ) throw QString("invalid input in Printf!");
                for(int j=0; j< target.length();j++) {
                    if(target[j]<'0' || target[j]>'9'){
                        isNum=0;
                        break;
                    }
                }
                if(isNum == 1){ // is number
                    replacePair.push_back(myPair(i,target));
                    if(++replacementIndex <list1.length())
                        target =  list1[replacementIndex].trimmed();
                    else target == nullptr;
                }
                else  if(IS_LETTER(target)){ // is variable
                    for (int j = 0; j < variables.size(); j++){
                        if(variables[j].varName == target){
                            if(variables[j].type==0){
                                replacePair.push_back(myPair(i,variables[j].varValue));
                                if(++replacementIndex <list1.length())
                                    target =  list1[replacementIndex].trimmed();
                                else target == nullptr;
                            }
                            else {
                                QString tmp = variables[i].varValue.mid(1,variables[i].varValue.length()-1);
                                replacePair.push_back(myPair(i, tmp));
                                target =  list1[++replacementIndex];
                            }
                        }
                    }
                }
                else if(parse_string(target,inputStr)!=PARSE_ERR && IS_END(target)){ // is string
                    inputStr = inputStr.mid(1,inputStr.length()-1);
                    replacePair.push_back(myPair(i, inputStr));
                    if(++replacementIndex <list1.length())
                        target =  list1[replacementIndex].trimmed();
                    else target == nullptr;
                }
                else throw QString("invalid input in Printf!");
            }
            i+=2; //{}
        }
        else if(base[i]== "}")throw QString("Single } !");
        else i++;
    }
    // do the replacement
    result =base;
        for(int i=replacePair.size()-1;i>=0 ;i--){
            result = result.mid(0,replacePair[i].index)+replacePair[i].str+result.mid(replacePair[i].index+2);
            qDebug()<<result<<endl;
        }

    return result;
}

QString  PrintfStmt::tree(int i){
    return result;
}

PrintStmt::PrintStmt(int inputIndex, QString expr):Statement(inputIndex, 6){
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


RemStmt::RemStmt(int inputIndex, QString lineTmp):Statement(inputIndex,  7){
    stmt = "REM "+ lineTmp;
    remark=lineTmp;
    return;
}

QString RemStmt::runSingleStmt(QString par){}

QString  RemStmt::tree(int i){
    return remark;
}

EndStmt::EndStmt(int inputIndex):Statement(inputIndex, 8){
    stmt = "END";
}

QString EndStmt::runSingleStmt(QString par){return "";}

QString  EndStmt::tree(int i){return "";}

ErrorStmt::ErrorStmt(int inputIndex, QString content):Statement(inputIndex, 9){
    stmt = content;
}

QString  ErrorStmt::tree(int i){return "Error";}



