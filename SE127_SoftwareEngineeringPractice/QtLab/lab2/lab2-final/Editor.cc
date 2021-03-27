#include <iostream>
#include <sstream>
#include <exception>
#include "Editor.h"

using namespace std;

Editor::Editor()
{
    buffer = new Buffer();
}
Editor::~Editor()
{
    // TODO: Implement destructor
    delete buffer;
}

void Editor::run()
{
    string cmd;
    while (true)
    {
        cout << "cmd> ";
        cout.flush();
        getline(cin, cmd);
        if (cmd == "Q")
            break;
        try {
            dispatchCmd(cmd);
        } catch (const char *e) {
            cout << "? " << e << endl;
        } catch (const out_of_range &oor) {
            cout << "? " << oor.what() << endl;
        } catch (const range_error &re) {
            cout << "? " << re.what() << endl;
        }
    }
}
void Editor::cmdAppend()
{
    int addLineNum=0;
    int currentLineNum = buffer->getCurrentLineNum();
    cout << "It's input mode now. Quit with a line with a single dot(.)" << endl;
    // TODO: finish cmdAppend.
    while (true)
    {
        string text;
        getline(cin, text);
        if (text == ".")
            break;
        buffer->appendLine(text);
        addLineNum++;
    }
    //buffer->changeCurrentLineNum(currentLineNum+addLineNum);
}

void Editor::cmdInsert()
{
    cout << "It's input mode now. Quit with a line with a single dot(.)" << endl;
    bool firstLine = true;
    int addLineNum=0;
    int currentLineNum = buffer->getCurrentLineNum();
    //buffer->saveNBI(currentLineNum);
    while (true)
    {
        string text;
        getline(cin, text);
        if (text == ".")
            break;
        
        if (firstLine&&currentLineNum!=0) {//对于空表插入额外考虑。
            buffer->insertLine(text);
            firstLine = false;
        }
        else {
            buffer->appendLine(text);
        }
        addLineNum++;
    }
    //buffer->linkAfterInsert();
    buffer->changeCurrentLineNum(currentLineNum+addLineNum);
    
}

void Editor::cmdDelete(int start, int end)
{
    buffer->deleteLines(start, end);
}

void Editor::cmdNull(int line)
{
    cout <<buffer->moveToLine(line) << endl;
    buffer->changeCurrentLineNum(line);
}

void Editor::cmdNumber(int start, int end)
{
    buffer -> showLines(start, end);
    buffer -> changeCurrentLineNum(end);
}

void Editor::cmdWrite(const string &filename)
{
    buffer->writeToFile(filename);
}

void Editor::dispatchCmd(const string &cmd)
{
    if (cmd == "a") {
        cmdAppend();
        return;
    }
    if (cmd == "i") {
        cmdInsert();
        return;
    }
    try{
        if ((cmd[0]=='w'&&cmd.length()==1)||(cmd[0]=='w'  && cmd[1] == ' '&&cmd.length()==2 )) {
            throw  "? Filename not specified";
        }
    if (cmd[0] == 'w' && cmd[1] == ' ') {
        // TODO: call cmdWrite with proper arguments
        string file_name = cmd.substr(2);
        cmdWrite(file_name);
        return;
    }
    }
    catch(const char* c){
        cout <<  c << endl;
        return;
    }
    // TODO: handle special case "1,$n".
    if(cmd == "1,$n"){
        int lineNum = buffer ->getLineNumber();
        try{
        if (lineNum == 0) {
            throw "? Number range error";
        }}catch(const char* c){
            cout <<  c << endl;
            return;
        }
        cmdNumber(1,lineNum);
        return;
    }
    int start=100000000, end;
    char comma, type = ' ';
    stringstream ss(cmd);
    try{
        if ((ss >> start)&&ss.eof()) {
            if (start<=0||start>buffer->getLineNumber()) {
                throw "? Line number out of range";
            }
            cmdNull(start);
            return;
        }
        if(ss >> comma >> end >> type){
            if(start<=0)throw "? Line number out of range";
            if (ss.good()) {
                if (type == 'n') {
                    if(end<start)throw "? Number range error";
                    if(end>buffer->getLineNumber())throw "? Line number out of range";
                    cmdNumber(start, end);
                    return;
                } else if (type == 'd') {
                    if(end<start)throw "? Delete range error";
                    if(end>buffer->getLineNumber())throw "? Line number out of range";
                    cmdDelete(start, end);
                    return;
                }
            }
        }
        else{
            throw "? Bad/Unknown command";
        }
    }
    catch(const char* c){
        cout <<  c << endl;
        return;
    }
}
