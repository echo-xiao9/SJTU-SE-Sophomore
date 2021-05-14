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
    string a = "the variable was a number before!";
    QString inputString = "\"" + par.trimmed() + "\"";
    for (int i = 0; i < variables.size(); i++)
    {
        if(variables[i].varName == varName){
            if(variables[i].type==1) {
                    variables[i].varValue = inputString;
            }
            else
                throw a;
             flag1=1;
            break;
        }
    }
    if(flag1==0){
        var newVar(varName, inputString,1);
        variables.push_back(newVar);
    }
    return "";
}
QString InputStringStmt::findVar(){}
QString InputStringStmt::tree(int i){ return varName;}

InputStmt::InputStmt(int inputIndex, QString varName1,int varVal1):
    Statement(inputIndex, 1), varName(varName1), varVal(varVal1){
    stmt="INPUT "+varName1;
}

QString InputStmt::runSingleStmt(QString par){
    int flag1 = 0;
     string a = "the variable was a string before!";
    QString Parvalue= par.trimmed();
    for (int i = 0; i < variables.size(); i++)
    {
        if(variables[i].varName == varName){
            if(variables[i].type==0) {
                    variables[i].varValue = par;
            }
            else
                throw a;
             flag1=1;
            break;
        }
    }
    if(flag1==0){
        var newVar(varName, par);
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
                if(it->type == 1)throw QString("Can not change variable type!");
                it->varValue =QString::number(exp -> value); //update the value of exist var
                flag = true;
                return "";
            }
        }
        if(flag==false){
        var newVar(letVarName, QString::number(exp->value),0);
        variables.push_back(newVar);
        }
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
    if(i==0) return letVarName ;
    else return str;
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
    int num=0;int i=0;
    stmt = "PRINTF "+ inputStr;

    for(int i=0;i<inputStr.length();i++){
        if(inputStr[i]=="\'")inputStr[i]='\"'; // change ' to ''
    }
    str = inputStr;
    if(parse_string(inputStr,base)==PARSE_ERR)throw QString("invalid printf statement!");
    list1 = inputStr.split(QLatin1Char(','));
//    for(int i=0;i<inputStr.length();i++){
//        if(inputStr[i]=='\"')num++;
//        if(num==2)break;
//    }
//    base = str.mid(1,i-1);
//    QString remain = str.mid(i);
//    list1 = remain.split(QLatin1Char(','));
//    base = list1[0].trimmed();
    base=base.mid(1,base.length()-2);
}

parse_t Statement::parse_string(QString &ptr, QString &inputString){
    QString tmp = ptr;
    tmp= tmp.trimmed();
    int tail=0;
    if(tmp[0]=="\'"){
        if(tmp.indexOf("\"")!=-1)return PARSE_ERR;
        tail = tmp.indexOf("\'",1);
        if(tail== -1)return PARSE_ERR;
        inputString = tmp.mid(0, tail+1);
        ptr = tmp.mid(tail+1);
        return PARSE_STR;
    }
    else if(tmp[0]== "\""){
        if(tmp.indexOf("\'") !=-1)return PARSE_ERR;
        tail = tmp.indexOf("\"",1);
        inputString = tmp.mid(0, tail+1);
        ptr = tmp.mid(tail+1);
        return PARSE_STR;
    }
    return PARSE_ERR;
}

QString PrintfStmt::runSingleStmt(QString par){ // PRINTF "Mini Basic V {}", 2
    replacePair.clear();
    QString target;
    bool isNum=1;
    int i=0; int replacementIndex=1;
    QString inputStr="";
    int flag=0;
    // build the replace pair
    if(list1.length()>1 && replacementIndex <list1.length()){
        target =  list1[replacementIndex].trimmed();
    }
    while(i<base.length()){
        isNum=1;
        if(base[i]=='{'){
            if(base[i+1]!= '}')throw QString("Single { !");
            else {
                if(replacementIndex >=list1.size())
//                    throw QString("invalid input in Printf!");
                    break;
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
                    qDebug()<<variables.size()<<endl;
                    for (int j = 0; j < variables.size(); j++){
                        if(variables[j].varName == target){
                            flag=1; // found the var;
                            if(variables[j].type==0){// 0:num 1:string
                                replacePair.push_back(myPair(i,variables[j].varValue));
                                if(++replacementIndex <list1.length())
                                    target =  list1[replacementIndex].trimmed();
                                else target == nullptr;
                            }
                            else {
                                QString val = variables[j].varValue;
                                // problem
                                QString tmp = val.mid(1,val.length()-2); // delete the out ""
                                replacePair.push_back(myPair(i, tmp));
                                if(++replacementIndex <list1.length())
                                    target =  list1[replacementIndex].trimmed();
                            }
                            break;
                        }
                    }
                    if(flag==0) throw QString("can't find the variable in printf !");
                }
                else if(parse_string(target,inputStr)!=PARSE_ERR && IS_END(target)){ // is string
                    inputStr = inputStr.mid(1,inputStr.length()-2);
                    replacePair.push_back(myPair(i, inputStr));
                    if(++replacementIndex <list1.length())
                        target =  list1[replacementIndex].trimmed();
                    else target = nullptr;
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
    int index=0;
        for(int i=replacePair.size()-1;i>=0 ;i--){
            index = replacePair[i].index;
            result = result.mid(0,replacePair[i].index)+replacePair[i].str+result.mid(replacePair[i].index+2);
        }
    return result;
}

QString  PrintfStmt::tree(int i){
    QString targetList="";
    if(i==0)
    return base;
    for(int j=0;j<list1.size()-1;j++){
        targetList+=list1[j+1]+" ";
    }
    return targetList.trimmed();
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



