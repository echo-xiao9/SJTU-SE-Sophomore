#include "Statement.h"

Statement:: Statement(int inputIndex, QString inputStmt, vector<Statement::var> &Vars)
    :index(inputIndex),stmt(inputStmt), vars(Vars){

}

Statement:: ~Statement(){

}

RemStmt::RemStmt(int inputIndex, QString inputStmt,vector<Statement::var> &Vars):Statement(inputIndex, inputStmt, Vars){

}

LetStmt::LetStmt(int inputIndex, QString inputStmt,vector<Statement::var> &Vars):Statement(inputIndex, inputStmt, Vars){
    int tmp1 = inputStmt.toUpper().indexOf("LET");
    int tmp2=0;
    QString expString = inputStmt.mid(tmp1,inputStmt.length()-tmp1);
    expString.trimmed();
    tmp2 =  inputStmt.toUpper().indexOf("=");
    if(tmp2==-1)throw ExpException();
    var = inputStmt.mid(tmp1,tmp2-tmp1);
    QString expStr= inputStmt.mid(tmp2+1,inputStmt.length()-tmp2-1);
    rightExp = new Exp(expStr);
}

void LetStmt::handleLetStmt(){
        int found = stmt.indexOf("=");
        if(found==-1)throw ExpException() ;
        //divide the stmt.
        var = stmt.mid(0,found);
        QString letexp = stmt.mid(found,stmt.length()-found);
        rightExp=new Exp(letexp);
}

PrintStmt::PrintStmt(int inputIndex, QString inputStmt,vector<Statement::var> &Vars):Statement(inputIndex, inputStmt, Vars){
    inputStmt = inputStmt.trimmed();
    QString printExp = stmt.mid(5,inputStmt.length()-5);
    printExp = printExp.trimmed();
    rightExp=new Exp(printExp);
    value = rightExp->value;
}

InputStmt::InputStmt(int inputIndex, QString inputStmt,vector<Statement::var> &Vars):Statement(inputIndex,inputStmt, Vars){
    QString  varName= stmt.mid(5,inputStmt.length()-5);
    varName.trimmed();
    variable = varName;
}

GotoStmt::GotoStmt(int inputIndex, QString inputStmt,vector<Statement::var> &Vars):Statement(inputIndex,inputStmt, Vars){

}

IfStmt::IfStmt(int inputIndex, QString inputStmt,vector<Statement::var> &Vars):Statement(inputIndex,inputStmt, Vars){

}

EndStmt::EndStmt(int inputIndex, QString inputStmt,vector<Statement::var> &Vars):Statement(inputIndex,inputStmt, Vars){

}


















