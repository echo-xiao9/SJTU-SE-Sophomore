#include "Exp.h"
#include <string>
#include <iostream>
#include <stack>
vector<var>variables;

Exp::Exp(QString letexp)
{
    input = letexp.toStdString();

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

int Exp::getPriority(char C)
{
    if (C == '-' || C == '+')
        return 1;
    else if (C == '*' || C == '/')
        return 2;
    else if (C == '^')
        return 3;
    return 0;
}

int Exp::getPriority2(QString C)
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
    int num=0;Node*newNode;
    while(!IS_END(tmp)){
        if(IS_NUM(tmp)){
            parse_num(tmp, num);
            newNode = new Node(QString::number(num),0);
        }
        else if(tmp[0]=="-" && tmp[1]<'9' && tmp[1] > '0'){
            tmp = tmp.mid(1);
            parse_num(tmp, num);
            num = -num;
             newNode = new Node(QString::number(num),0); //？ can handle negative?
        }
        else if(parse_var(tmp, var) != PARSE_ERR){
             newNode = new Node(var,1);
        }
        else if(parse_delim(tmp, delim) == PARSE_OP){
            newNode = new Node(delim,2);
        }
        else throw "invalid expression";
        in.push_back(*newNode);
    }

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
            while (  nodeStack.size()!=0 && ( getPriority2(in[i].val)
                   < getPriority2(nodeStack.top().val))) {
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


}


string Exp::infixToPostfix()
{
    infix = '(' + infix + ')';
    int l = infix.size();
    stack<char> char_stack;
    string output;
    for (int i = 0; i < l; i++) {
        // If the scanned character is an
        // operand, add it to output.
        if (isalpha(infix[i]) || isdigit(infix[i]))
            output += infix[i];

        // If the scanned character is an
        // ‘(‘, push it to the stack.
        else if (infix[i] == '(')
            char_stack.push('(');

        // If the scanned character is an
        // ‘)’, pop and output from the stack
        // until an ‘(‘ is encountered.
        else if (infix[i] == ')')
        {
            while (char_stack.top() != '(')
            {
                output += char_stack.top();
                char_stack.pop();
            }
            // Remove '(' from the stack
            char_stack.pop();
        }

        // Operator found
        else {
            if (isOperator(char_stack.top()))
            {
                while ((getPriority(infix[i])
                    < getPriority(char_stack.top()))
                    || (getPriority(infix[i])
                    <= getPriority(char_stack.top()) && infix[i] == '^'))
                {
                    output += char_stack.top();
                    char_stack.pop();
                }
                // Push current Operator on stack
                char_stack.push(infix[i]);
            }
        }
    }
    postfix = output;
    return output;
}

//string Exp::infixToPrefixLetter(){

//}

string Exp:: infixToPrefix()
{
    /* Reverse String
    * Replace ( with ) and vice versa
    * Get Postfix
    * Reverse Postfix * */
    int l = infix.size();

    // Reverse infix
    reverse(infix.begin(), infix.end());

    // Replace ( with ) and vice versa
    for (int i = 0; i < l; i++) {
        if (infix[i] == '(') {
            infix[i] = ')';
            i++;
        }
        else if (infix[i] == ')') {
            infix[i] = '(';
            i++;
        }
    }

    string prefix = infixToPostfix();
    // Reverse postfix
    reverse(prefix.begin(), prefix.end());
    return prefix;
}

int Exp::precedence(char op){
    if(op == '+'||op == '-')
    return 1;
    if(op == '*'||op == '/')
    return 2;
    return 0;
}

// Function to perform arithmetic operations.
int  Exp::applyOp(int a, int b, char op){
    switch(op){
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/': return a / b;
    }
}

// Function that returns value of
// Exp after evaluation.
int  Exp::evaluate(){
//    in.clear();
//    post.clear();

    prepare();
    getInfixVec();
    infixToPostfixVec();
    infixToPostfix();
    buildSynTree();
    int i;
    // stack to store integer values.
    stack <int> values;
    // stack to store operators.
    stack <char> ops;

    for(i = 0; i < infix.length(); i++){

        // Current token is a whitespace,
        // skip it.
        if(infix[i] == ' ')
            continue;

        // Current token is an opening
        // brace, push it to 'ops'
        else if(infix[i] == '('){
            ops.push(infix[i]);
        }

        // Current token is a number, push
        // it to stack for numbers.
        else if(isdigit(infix[i])){
            int val = 0;

            // There may be more than one
            // digits in number.
            while(i < infix.length() &&
                        isdigit(infix[i]))
            {
                val = (val*10) + (infix[i]-'0');
                i++;
            }

            values.push(val);

            // right now the i points to
            // the character next to the digit,
            // since the for loop also increases
            // the i, we would skip one
            //  token position; we need to
            // decrease the value of i by 1 to
            // correct the offset.
              i--;
        }

        // Closing brace encountered, solve
        // entire brace.
        else if(infix[i] == ')')
        {
            while(!ops.empty() && ops.top() != '(')
            {
                int val2 = values.top();
                values.pop();

                int val1 = values.top();
                values.pop();

                char op = ops.top();
                ops.pop();

                values.push(applyOp(val1, val2, op));
            }

            // pop opening brace.
            if(!ops.empty())
               ops.pop();
        }
        // Current token is an operator.
        else
        {
            // While top of 'ops' has same or greater
            // precedence to current token, which
            // is an operator. Apply operator on top
            // of 'ops' to top two elements in values stack.
            while(!ops.empty() && precedence(ops.top())
                                >= precedence(infix[i])){
                int val2 = values.top();
                values.pop();

                int val1 = values.top();
                values.pop();

                char op = ops.top();
                ops.pop();

                values.push(applyOp(val1, val2, op));
            }

            // Push current token to 'ops'.
            ops.push(infix[i]);
        }
    }

    // Entire expression has been parsed at this
    // point, apply remaining ops to remaining
    // values.
    while(!ops.empty()){
        int val2 = values.top();
        values.pop();

        int val1 = values.top();
        values.pop();

        char op = ops.top();
        ops.pop();

        values.push(applyOp(val1, val2, op));
    }
    value = values.top();
    // Top of 'values' contains result, return it.
    return values.top();
}

void Exp::prepare(){
    int varIndex=0;
    QString input1= QString::fromStdString(input);
    QString tmp="";
    QString varVal;
    QString varNa="";

    for(int i = 0;i < input1.length(); i++){
        if(input1[i] == '-'){
            if(i == 0){
                input1.insert(0,'0');
            }else if(input1[i-1] == '('){
                input1.insert(i,'0');
            }
        }
    }
    for(int i=0;i<variables.size();i++){
        varIndex = input1.indexOf(variables[i].varName);
        while(varIndex!=-1){
            varNa = variables[i].varName;
            varVal = QString::number(variables[i].varValue);
            input1 = input1.mid(0,varIndex)+varVal+input1.mid(varIndex+varVal.length());
            varIndex = input1.indexOf(variables[i].varName);
        }
    }
    for(int i=0;i<input1.length();i++)
    {
        if((input1[0]>='a' && input1[0]<='z') || (input1[0]>='A' && input1[0]<='Z')){
             QString error= "There are undeclared variables in the expression";
             throw error;
        }


    }
    infix = input1.toStdString();
}

void  Exp::buildSynTree(){
    stack <Node*> synStack;

    cout<<endl;
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







