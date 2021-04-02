#include "Exp.h"
vector<var>variables;

Exp::Exp(QString letexp)
{
    infix= letexp.toStdString();
    postfix=infixToPostfix();
    prefix=infixToPrefix();
    value=evaluate();
    cout<<value<<endl;
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

    // Top of 'values' contains result, return it.
    return values.top();
}

void Exp::prepare(){






}

