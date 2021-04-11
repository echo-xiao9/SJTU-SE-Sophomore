#ifndef Exp_H
#define Exp_H
#include <string>
#include<stack>
#include <iostream>
#include <QString>
#include <QDebug>
using namespace std;
typedef enum { PARSE_ERR=-1, PARSE_LINE, PARSE_STMT, PARSE_CMD,
  PARSE_NUM, PARSE_VAR, PARSE_EXP, PARSE_CON, PARSE_OP, PARSE_DEL} parse_t;

#define IS_NUM(s) (s[0]>='0' && s[0]<='9')
#define IS_LETTER(s) ((s[0]>='a' && s[0]<='z') || (s[0]>='A' && s[0]<='Z'))
#define IS_COMMENT(s) (s[0]=='#')
#define IS_BLANK(s) (s[0]==' ' || s[0]=='\t')
#define IS_END(s) (s[0]=='\0')
#define IS_OPERATOR(s) (s[0]=='+'|| s[0]== '-' ||  s[0]=='*' || s[0]=='/' || s[0]=='('  )
parse_t parse_num(QString &ptr, int & val);

struct var{
    QString varName="";
    int varValue=0;
    var(QString name, int val): varName(name), varValue(val){}
};
extern vector<var>variables;

struct Node{
    QString val; //var:mame num:val operator:name
    int type; // 0:num 1:var 2:op
    Node *left;
    Node *right;
    Node(QString value, int Type, Node*Left=NULL, Node*Right = NULL):
        val(value), type(Type), left(Left), right(Right){}
    int getVarVal(){
        // return -1 if is not variable or can't find the exist variable
        if(type!=1)return -1;
        for(int i=0;i<variables.size();i++){
            if(variables[i].varName == val){
                return variables[i].varValue;
            }
        }
        return -1;
    }
};


class Exp
{
private:
     stack <Node*> values;
     stack <Node*> ops;

public:
    Node *root = nullptr;
    vector <Node> in;
    vector <Node> post;
    string input;
    string infix;
    string postfix;
    string prefix;
    int value;
    void combine();

    Exp(QString letexp);
    bool isOperator(char c);
//    int getPriority(char C);
    int getPriority(QString C);
    parse_t parse_num(QString &ptr, int & val);
    parse_t parse_var(QString &ptr, QString& name);
    parse_t parse_delim(QString &ptr, QString& delim);
//    string infixToPostfix();
    void getInfixVec();
    void infixToPostfixVec();
//    string infixToPrefix();
    int precedence(char op);
//    int precedence2(QString op);
//    int  applyOp(int a, int b, char op);
    int applyOp(int a, int b, string op);
//    int  evaluate();
    void evaluate();
    int recurEvaluate(Node *t);
//    void prepare();
//    void prepare2(); //may be no need
    void buildSynTree();
};

class ExpException{
public:
    ExpException(){
        cout<<"Expression does not conform to the specification!"<<endl;
    }
};

#endif // Exp_H
