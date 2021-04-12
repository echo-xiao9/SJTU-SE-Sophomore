#include "Exp.h"
#include <string>
#include <iostream>
#include <stack>
#include <cmath>
vector<var>variables;

Exp::Exp(QString letexp)
{
    input = letexp.toStdString();
    buildSynTree();
}


parse_t Exp:: parse_num(QString &ptr, int & val){
    QString tmp=ptr;
    int i=0;
    tmp=tmp.trimmed();
    if(IS_END(tmp)) return PARSE_ERR;
    if(!IS_NUM(tmp)) return PARSE_ERR;
    for(i=0;i<tmp.length()&&(tmp[i]>='0' && tmp[i]<='9');i++){
    }
    val=tmp.mid(0,i).toInt();
    ptr=tmp.mid(i);
    return PARSE_NUM;
}

parse_t  Exp::parse_var(QString &ptr, QString& name){
    //    begin with a letter or an underscore.  only have letters, numbers,  underscore
    QString tmp=ptr;
    int i=0;
    tmp=tmp.trimmed();
    if(IS_END(tmp)) return PARSE_ERR;
    if(!(tmp[0] == '_'|| IS_LETTER(tmp)))return PARSE_ERR;
    while(tmp[i]=='_' ||(tmp[i]>='0'&& tmp[i]<='9') ||
          (tmp[i]>='a'&& tmp[i]<='z') || (tmp[i]>='A'&& tmp[i]<='Z')){
        i++;
    }
    name = tmp.mid(0,i);
    tmp = tmp.mid(i);
    ptr = tmp;
    if(IS_END(name))return PARSE_ERR;
    return PARSE_VAR;
}

parse_t Exp:: parse_delim(QString &ptr, QString& delim){
    QString tmp=ptr;
    tmp=tmp.trimmed();
    if(IS_END(tmp)) return PARSE_ERR;
    if(tmp[0]=='=' || tmp[0] =='>' || tmp[0] == '<'){
        delim =tmp.mid(0,1);
        tmp = tmp.mid(1);
        ptr = tmp;
        return PARSE_CON;
    }
    if(tmp[0]=='+' || tmp[0] =='-' || tmp[0] == '/'|| tmp[0] == '(' ||tmp[0] == ')'){
        delim =tmp.mid(0,1);
        tmp = tmp.mid(1);
        ptr = tmp;
        return PARSE_OP;
    }
    if(tmp[0] == '*'){
        if(tmp[1]=='*') {
            delim = tmp.mid(0,2);
            tmp = tmp.mid(2);
        }
        else {
            delim = tmp.mid(0,1);
            tmp = tmp.mid(1);
        }
        ptr = tmp;
        return PARSE_OP;
    }
    return PARSE_ERR;
}





bool Exp::isOperator(char c)
{
    return (!isalpha(c) && !isdigit(c));
}


int Exp::getPriority(QString C)
{
    if (C == '-' || C == '+')
        return 1;
    else if (C == '*' || C == '/')
        return 2;
    else if (C == "**")
        return 3;
    return 0;
}

void Exp::getInfixVec(){
    QString tmp = QString::fromStdString(input);
    QString delim="";
    QString var="";
    QString expError="Invalid expression";
    int num=0;Node*newNode;
    tmp=tmp.trimmed();
    while(!IS_END(tmp)){
        //        if(tmp[0]=="-"){
        //            qDebug()<<"-"<<endl;
        //        }
        if(IS_NUM(tmp)){
            parse_num(tmp, num);
            newNode = new Node(QString::number(num),0);
        }
        else if(tmp[0]=="("){
            parse_delim(tmp, delim);
            newNode = new Node(delim,2);
            in.push_back(*newNode);
            if(parse_delim(tmp, delim)!=PARSE_ERR ){
                if(delim=="-"){
                    if(parse_num(tmp, num)!=PARSE_ERR) newNode = new Node(QString::number(-num),0);
                    else if(parse_var(tmp, var) != PARSE_ERR){
                        newNode = new Node(var,1);
                    }
                    else throw expError;
                    in.push_back(*newNode);

                }else throw expError;
            }
             continue;
        }

        else if(parse_var(tmp, var) != PARSE_ERR){
            newNode = new Node(var,1);
        }
        else if(parse_delim(tmp, delim) == PARSE_OP){
            newNode = new Node(delim,2);
        }
        else throw expError;
        in.push_back(*newNode);
    }
    for(int i=0;i<in.size();i++)qDebug()<<in[i].val;
    qDebug()<<endl;

}

void Exp::infixToPostfixVec(){ // num(-), var, operations
    stack<Node> nodeStack;
    for(int i=0;i<in.size();i++){
        if(in[i].type == 0 || in[i].type == 1){
            post.push_back(in[i]);
        }
        else if(in[i].val == "(") nodeStack.push(in[i]);
        else if(in[i].val == ")"){
            while (nodeStack.top().val != '(')
            {
                post.push_back(nodeStack.top());
                nodeStack.pop();
            }
            // Remove '(' from the stack
            nodeStack.pop();
        }
        else{
            while (  nodeStack.size()!=0 &&(  getPriority(in[i].val)
                                              <= getPriority(nodeStack.top().val)) ) {
                if(getPriority(in[i].val)==3 && getPriority(nodeStack.top().val)==3  )break;
                post.push_back(nodeStack.top());
                nodeStack.pop();
            }
            // Push current Operator on stack
            nodeStack.push(in[i]);
        }
    }
    while (nodeStack.size())  {
        post.push_back(nodeStack.top());
        nodeStack.pop();
    }
        for(int i=0;i<post.size();i++)qDebug()<<post[i].val;
        qDebug()<<endl;
}


int Exp::precedence(char op){
    if(op == '+'||op == '-')
        return 1;
    if(op == '*'||op == '/')
        return 2;
    return 0;
}



int  Exp::applyOp(int a, int b, string op){
    switch(op[0]){
    case '+': return a + b;
    case '-': return a - b;
    case '*':
        if(op[1]=='*') return pow(a,b);
        else return a * b;
    case '/': return a / b;
    }
}


void Exp::evaluate(){
    value = recurEvaluate(root);
}

int Exp::recurEvaluate(Node *t){
    if(t==nullptr)return 0;
    switch (t->type) {
    case 0: //num
        return t->val.toInt();
    case 1://var
        return t->getVarVal();
    default: //op
        int val1=recurEvaluate(t->left);
        int val2 = recurEvaluate(t->right);
        return applyOp(val1, val2, t->val.toStdString());
    }
}


void  Exp::buildSynTree(){
    getInfixVec();
    infixToPostfixVec();
    stack <Node*> synStack;
    Node* n;
    for(int i=0;i<post.size();i++){
        n= &post[i];
        if(n->type == 0|| n->type==1 )
            synStack.push(n); // for num and variable, just push it into stack
        else{
            if(synStack.empty()){
                QString error = "invalid expression!";
                throw  error;
            }
            Node*rightNode = synStack.top();
            synStack.pop();
            if(synStack.empty()){
                QString error = "invalid expression!";
                throw error;
            }
            Node*leftNode = synStack.top(); //for operater, pop 2 node and set left and right.(can exchange)
            synStack.pop();
            n->left = leftNode;
            n->right = rightNode;
            synStack.push(n);
        }
    }
    if(synStack.size()==1){
        if(synStack.top()->type == 2){
            root = synStack.top();
            return ;
        }
        else if(in.size()==1){
            root =  synStack.top(); // if only one num eg. let a=1; let a=b;
            return ;
        }
    }
    QString error = "invalid expression!";
    throw error;
}







