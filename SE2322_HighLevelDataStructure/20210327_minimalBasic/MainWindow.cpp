#include "MainWindow.h"
#include "ui_MainWindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(ui->clearButton,SIGNAL(clicked()),this,SLOT(clearAll()));
    connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
    connect(ui->loadButton,SIGNAL(clicked()),this,SLOT(on_loadButton_clicked()));
    connect(ui->runButton, SIGNAL(clicked()), this, SLOT(runApp()));
    curLine=0;
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::updateCodeBrowser(){
    ui->codeBrowser->clear();
    QString appendLine="";
    auto iter = statements.begin();
    while (iter !=statements.end()) {
        QString singleStmt = iter->second->stmt;
        appendLine =QString(QString::number(iter->first))+' '+ iter->second->stmt;
        ++iter;
        ui->codeBrowser->append(appendLine);
    }
    highLightErrorCode();
}

int getIndexPos(){

}
void  MainWindow::highLightErrorCode(){
    // 获取需要高亮的 TextEdit 对象(QTextBrowser 是 QTextEdit 的只读子类)
    QTextBrowser* code=ui->codeBrowser;
    QTextCursor cursor(code->document());
    // 用于维护的所有高亮的链表
    QList<QTextEdit::ExtraSelection> extras;
     errorHighLights = {
    {1, QColor(100, 255, 100)},
    {100, QColor(255, 100, 100)},
    {4, QColor(255, 100, 100)}
    };
    // 配置高亮，并加入到 extras 中 for (auto &line : highlights) {
    for(auto &line:errorHighLights){
        QTextEdit::ExtraSelection h;
        h.cursor = cursor;
    // 下面这些的功能，请大家自行查看文档
        h.cursor.setPosition(line.first);
        h.cursor.movePosition(QTextCursor::StartOfLine);
        h.cursor.movePosition(QTextCursor::EndOfLine);
        h.format.setProperty(QTextFormat::FullWidthSelection, true);
        h.format.setBackground(line.second);
        extras.append(h);
    }
    //应用高亮效果
    code->setExtraSelections(extras);
}



void MainWindow::updateVarBrowser(){
    QString appendLine="";
    ui->varBrowser->clear();
    for (int i = 0; i < variables.size(); i++)
    {
        appendLine =variables[i].varName +" = " + variables[i].varValue;
        ui->varBrowser->append(appendLine);
    }
}

void MainWindow::updateResultBrowser(){
    ui->resultBrowser->clear();
    for(int i=0;i<results.size();i++)
        ui->resultBrowser->append(results[i]);
}

void MainWindow:: updateSyntaxDisplayBroser(){
    ui->syntaxDisplayBroser->clear();
    for(int i=0;i<synTree.size();i++)
        ui->syntaxDisplayBroser ->append(synTree[i]);
}

void MainWindow::codeLineEdit_return(){
    try{
        QString input = ui->codeLineEdit ->text();
        //input is a statement
        ui->codeLineEdit->clear();
        parse_line(input);
        ui->codeBrowser->clear();
        updateCodeBrowser();
    }catch(QString error){
        ui->messageLineEdit->setText(error);
    }
}


void MainWindow::clearAll(){
    // clear all the information of the program.
    clearAppStatus();
    statements.clear();
    variables.clear();
    ui->codeBrowser->clear();
}

void MainWindow::clearAppStatus(){
    //clear the status in the program, including the content on GUI , syntax tree and results.
    synTree.clear();

    results.clear();
    ui->codeLineEdit->clear();
    ui->messageLineEdit->clear();
    ui->resultBrowser->clear();
    ui->syntaxDisplayBroser->clear();
    ui->varBrowser->clear();
    ui->messageLineEdit->clear();

}


void MainWindow::on_loadButton_clicked(){
    static bool i=0;
    if(!i)loadStat();
    i=!i;
}

void MainWindow::loadStat(){
    // load statements from files.
    QString fileName = QFileDialog::getOpenFileName();
    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)){
        QString error ="can't open file!";
        throw error;
    }
    statements.clear();//clear current statements before loading
    QTextStream in(&file);
    QString line ="";
    while (!in.atEnd()) {
        QString line = in.readLine();
        parse_line(line);
        updateCodeBrowser();
    }
    file.close();
}

void MainWindow::runApp(){
    // the relation is false!!!!!!!!!!
    // run the statement one by one.
    int i=0;
    try {
        QString loop1="The program will loop forever！";
        clearAppStatus();
        curLine=0;
        QString par="";
        QString result = "";
        drawTree();
        updateSyntaxDisplayBroser();
        map<int, Statement*>::iterator it = statements.begin();
        while(it !=statements.end()){
            i++;
            if(i>100000) throw loop1; // Bug: loop forever
            switch (it->second->type) {

           // 0: INPUTS,1:INPUT, 2：LET, 3：GOTO, 4:IF,  5:PRINTF, 6: PRINT， 7:REM, 8:END,9:THEN
            case 0: // INPUTS
                try{
                ui->codeLineEdit-> setPlaceholderText(" ? ");
                disconnect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
                connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(getCodeLineStrVal()));
                loop.exec();
                it->second->runSingleStmt(inputStr);
                disconnect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(getCodeLineStrVal()));
                connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
                ui->codeLineEdit-> setPlaceholderText("");
            }catch(QString error){
                    ui->messageLineEdit->setText(error);
                    disconnect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(getCodeLineStrVal()));
                    connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
                }
                it++;
                break;
            case 1://INPUT
                try{
                ui->codeLineEdit-> setPlaceholderText(" ? ");
                disconnect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
                connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(getCodeLineVal()));
                loop.exec();
                it->second->runSingleStmt(inputNumTmp);
                disconnect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(getCodeLineVal()));
                connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
                ui->codeLineEdit-> setPlaceholderText("");
            }catch(QString error){
                    ui->messageLineEdit->setText(error);
                    disconnect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(getCodeLineVal()));
                    connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
                }
                it++;
                break;
            case 2: //LET
                it->second->runSingleStmt(par);
                it++;
                break;
            case 3: // GOTO
                result  = it->second->runSingleStmt(par); //the target index
                curLine = result.toInt();
                for ( it = statements.begin(); it != statements.end(); it++)
                {
                    if((*it).second->index == curLine) {
                        break;
                    }
                }
                if(it==statements.end()){// haven't find the index
                    QString error ="invalid line number in GOTO statement";
                    throw error;
                }

                break;
            case 4: //IF
                curLine= it->second->runSingleStmt(par).toInt();
                if(curLine== -1){
                    it++;
                    break;
                }
                for ( it = statements.begin(); it != statements.end(); it++)
                {
                    if((*it).second->index == curLine) {
                        break;
                    }
                }
                if(it==statements.end()){// haven't find the index
                    QString error = "invalid line number in IF THEN statement";
                    throw error;
                }
                break;
             case 5: // PRINTF
                result= it->second->runSingleStmt(par);
                //    ui->resultBrowser->append(result);
                results.push_back(result);
                it++;
                break;
            case 6: // PRINT
                result= it->second->runSingleStmt(par);
                //    ui->resultBrowser->append(result);
                results.push_back(result);
                it++;
                break;
            case 7: // REM
                it++;
                break;
            case 8: // END
                it = statements.end();
                break;
            default: //ERROR
                it++;
                break;
            }
            if(it==statements.end())break;
        }
        updateVarBrowser();
        updateResultBrowser();
        ui->messageLineEdit ->setText("Program ended successfully.");
        variables.clear();
        ui->codeLineEdit->clear();
    }catch(QString s){
        ui->messageLineEdit ->setText(s);
        variables.clear();
    }
};


void MainWindow::getCodeLineVal(){
    QString errorNum ="Invaild number in input statement!";
    //    ui->codeLineEdit-> setPlaceholderText(" ? ");
    inputNumTmp = ui->codeLineEdit->text();
    inputNumTmp = inputNumTmp.trimmed();
    for(int i=0;i<inputNumTmp.length();i++){
        if(inputNumTmp[i]<'0' || inputNumTmp >"9") throw errorNum;
    }
    loop.exit();
    return;
}
void MainWindow::getCodeLineStrVal(){
    inputStr = ui->codeLineEdit->text();
    inputStr = inputStr.trimmed();

    loop.exit();
    return;
}

void MainWindow:: showHelpWin(){
    Help *helpWin = new Help();
    helpWin ->show();
}


void MainWindow:: drawExpBranch(Exp *exp, int indentation){
    if(exp==nullptr)return;
    recurPrintExp(exp->root, indentation);
}

void MainWindow::recurPrintExp(Node *n,  int indentation){
    QString tmp;
    for(int i=0;i<indentation*4;i++) tmp = tmp +" ";
    tmp = tmp+ n->val;
    synTree.push_back( tmp);
    if(n->left) recurPrintExp(n->left, indentation+1);
    if(n->right) recurPrintExp(n->right, indentation+1);
}


void MainWindow:: drawTree(){
    // -1 means no type the type order from 0-6 is
    // 0:INPUT   1:LET   2:GOTO  3:IF   4:PRINT    5:REM   6:END
    // 0: INPUTS,1:INPUT, 2：LET, 3：GOTO, 4:IF,  5:PRINTF, 6: PRINT， 7:REM, 8:END,9:THEN
    // we only need to draw  LET IF GOTO PRINT
    QString synBranch;
    map<int, Statement*>::iterator it = statements.begin();
    while(it !=statements.end()){
        switch (it->second->type) {
        case 0: //INPUTS
            synTree.push_back(QString::number(it->first)+" INPUTS");
            synBranch =   "    " +it->second->tree();
            synTree.push_back(synBranch);
            break;
        case 1: //INPUT
            synTree.push_back(QString::number(it->first)+" INPUT");
            synBranch =   "    " +it->second->tree();
            synTree.push_back(synBranch);
            break;
        case 2: //LET
            synTree.push_back(QString::number(it->first)+" LET =");
            synBranch =   "    " +it->second->tree();
            synTree.push_back(synBranch);
            drawExpBranch(it->second->exp, 1);
            break;
        case 3: //GOTO
            synTree.push_back(QString::number(it->first)+ " GOTO");
            synBranch =   "    " +it->second->tree();
            synTree.push_back(synBranch);
            break;

        case 4: //IF
            synTree.push_back( QString::number(it->first)+" IF  THEN");
            drawExpBranch(it->second->exp, 1);
            synBranch =   "    "+it->second->tree();
            synTree.push_back(synBranch);
            drawExpBranch(it->second->exp1, 1);
            synBranch =   "    "+it->second->tree(1);
            synTree.push_back(synBranch);
            break;
        case 5: // PRINTF
             synTree.push_back( QString::number(it->first)+" PRINTF");
             synBranch =   "    " +it->second->tree(0);
             synTree.push_back(synBranch);
             synBranch =   "    " +it->second->tree(1);
             synTree.push_back(synBranch);
            break;

        case 6:  //PRINT
            synTree.push_back( QString::number(it->first)+" PRINT");
            drawExpBranch(it->second->exp, 1);
            break;

        case 7:  //REM
            synTree.push_back( QString::number(it->first)+" REM");
            synBranch =   "    " +it->second->tree();
            synTree.push_back(synBranch);
            break;

        case 8: //end
            synTree.push_back(QString::number(it->first)+" END");
            break;

        case 9: //error
            synTree.push_back(QString::number(it->first)+" Error");
            break;

        default:
            break;

        }

        it++;
    }

}

parse_t MainWindow:: parse_line(QString &line){
    stmt_t stmtTmp;
    cmd_t cmdTmp;
    QString lineTmp=line, varName="", exp="", exp1="", delim="", errorStrBackUp="", inputString="";
    int index = -1; //index for condition in if
    int indexThen = -1;    // index for THEN in if
    pair<map<int, Statement*>::iterator, bool> Insert_Pair;
    Statement *newStmt;
    int lineNum=0, numTmp=0, printfNum=0;
    int type=0; //0:num 1:string
    QString numError="Invalid line number!";
    QString stmtError = "Invalid statement!";
    QString cmdError = "Invalid comand / Statement!";
    QString varError ="Invalid variable name in input statement!";
    QString strError = "Invalid string in INPUTS statement!";
    // is command
    if(line[0]=="-"){
        throw numError;
    }
    if(IS_NUM(line)){
        try{
            if(parse_num(lineTmp,lineNum)==PARSE_ERR) throw numError;
            errorStrBackUp = lineTmp;
            errorStrBackUp=errorStrBackUp.trimmed();
            if(lineNum>1000000)throw numError;
            if(IS_END(lineTmp)){
                if(! statements.erase(lineNum))
                    throw stmtError;
                return PARSE_DEL;
            }
            if(parse_stmt(lineTmp, stmtTmp)==PARSE_ERR)
                throw  stmtError;
               // 0: INPUTS,1:INPUT, 2：LET, 3：GOTO, 4:IF,  5:PRINTF, 6: PRINT， 7:REM, 8:END,9:THEN
            switch (stmtNum(stmtTmp))
            {
            case 0: //"INPUTS"  35 INPUTS n3
                if(parse_var(lineTmp, varName) == PARSE_ERR) throw varError;
                newStmt =  new InputStringStmt(lineNum, varName,inputString); // inputString is not input??
                break;
            case 1: //"INPUT": 35 INPUT n3
                if(parse_var(lineTmp, varName) == PARSE_ERR) throw varError;

                //              newStmt = new InputStmt(lineNum, varName, numTmp, statements);
                newStmt = new InputStmt(lineNum, varName,numTmp);
                break;
            case 2://"LET": //40 LET total = n1 + n2 + n3  LET s = "hello world"    LET t = 'Mini Basic'
                inputString = ""; //init
                type=0; //0:num 1:string
                if(parse_var(lineTmp, varName)==PARSE_ERR ||
                        parse_delim(lineTmp, delim)==PARSE_ERR||
                        delim !="=" )throw stmtError;
                if(parse_string(lineTmp, inputString) !=PARSE_ERR) { // is string
                    if(! IS_END( lineTmp)) throw stmtError;
                    newStmt = new LetStmt(lineNum, varName, inputString,1);
                    break;
                }
                else if( parse_exp(lineTmp,exp) != PARSE_ERR){ // is num
                    newStmt=new LetStmt(lineNum, varName, exp,0);
                    break;
                }
                else throw  stmtError;
            case 3: //"GOTO" GOTO n
                if(parse_num(lineTmp,numTmp)==PARSE_ERR)throw numError;
                newStmt = new GotoStmt(lineNum, numTmp);
                break;

            case 4://"IF":  //IF condition THEN n
                if(lineTmp.indexOf("<") !=-1){
                    index = lineTmp.indexOf("<");
                    delim = "<";
                }else if(lineTmp.indexOf("=" )!= -1){
                    index =lineTmp.indexOf("=" );
                    delim = "=";
                }else if(lineTmp.indexOf(">") != -1){
                    index =lineTmp.indexOf(">" );
                    delim = ">";
                }
                if(index == -1) return PARSE_ERR;
                exp = lineTmp.mid(0,index);
                exp = exp.trimmed();
                indexThen = lineTmp.indexOf("THEN", 0,  Qt::CaseInsensitive);
                exp1 = lineTmp.mid(index+1, indexThen-index-1);
                exp1= exp1.trimmed();
                // !!!!numTmp;
                lineTmp = lineTmp.mid(indexThen+4);
                if(parse_num(lineTmp, numTmp)==PARSE_ERR)throw numError;
                newStmt = new IfStmt(lineNum, exp,  delim, exp1, numTmp);
                break;

            case 5: //"PRINTF"
                newStmt = new PrintfStmt(lineNum,lineTmp);
                break;
            case 6: //"PRINT": //PRINT 2 + 2
                if(parse_exp(lineTmp, exp)==PARSE_ERR)throw numError;
                newStmt = new PrintStmt(lineNum,exp);
                break;

            case 7: //"REM": //REM aaa
                newStmt = new RemStmt(lineNum,lineTmp);
                break;

            case 8: //"END":
                newStmt = new EndStmt(lineNum);
                break;

            default:
                throw stmtError;
            }
        }catch(QString e){
            newStmt = new ErrorStmt(lineNum, errorStrBackUp);
            errorIndex.push_back(lineNum);
        }
        Insert_Pair = statements.insert(pair<int, Statement*>(lineNum, newStmt));
        // if the index exits
        if(!Insert_Pair.second) {
            auto iter = statements.find(lineNum);
            // if we can find the same index, replace it with the new one.
            if(iter != statements.end()) statements.erase(iter);
            Insert_Pair = statements.insert(pair<int, Statement*>(lineNum, newStmt));
        }
    }
    else if(IS_LETTER(line)){
        if(parse_stmt(lineTmp,  stmtTmp)!=PARSE_ERR){
            var v("",0);
            QString result="";
            switch (stmtNum(stmtTmp)) {
            //LET、PRINT、INPUT可以不带行号直接输入执行
            // 0:INPUT   1:LET   2:GOTO  3:IF   4:PRINT    5:REM   6:END
             // 0: INPUTS,1:INPUT, 2：LET, 3：GOTO, 4:IF,  5:PRINTF, 6: PRINT， 7:REM, 8:END,9:THEN
            case 1: // input
                if(parse_var(lineTmp, varName)==PARSE_ERR) throw stmtError;
                try{
                ui->codeLineEdit->setPlaceholderText(" ? ");
                disconnect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
                connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(getCodeLineVal()));
                loop.exec();
                v.varName = varName;
                v.varValue = inputNumTmp.toInt();
                ui->codeLineEdit->setPlaceholderText("");
                variables.push_back(v);
                updateVarBrowser();
                disconnect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(getCodeLineVal()));
                connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
                break;
            }catch(QString error){
                    ui->messageLineEdit->setText(error);
                    disconnect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(getCodeLineVal()));
                    connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(codeLineEdit_return()));
                }

                break;
            case 2: //let
                if(parse_var(lineTmp, varName)==PARSE_ERR ||
                        parse_delim(lineTmp, delim)==PARSE_ERR||
                        delim !="="||
                        parse_exp(lineTmp,exp)==PARSE_ERR)
                    throw stmtError;
                newStmt=new LetStmt(0, varName, exp);
                newStmt->runSingleStmt("");
                updateVarBrowser();
                break;
            case 6: //print
                if(parse_exp(lineTmp, exp)==PARSE_ERR)throw numError;
                newStmt = new PrintStmt(lineNum,exp);
                result = newStmt->runSingleStmt("");
                results.push_back(result);
                updateResultBrowser();
                break;
            default:
                break;
            }
            return PARSE_STMT;
        }
        if(parse_cmd(lineTmp, cmdTmp)==PARSE_ERR)throw cmdError;
        switch (cmdNum(cmdTmp))
        {
        case 0://"RUN":
            runApp();
            break;
        case 1://"LOAD":
            loadStat();
            break;
        case 2://"LIST":

            break;
        case 3: //"CLEAR":
            clearAll();

            break;
        case 4: //"HELP":
            showHelpWin();
            break;
        case 5: //"QUIT":
            QApplication::quit();
            break;
        default:
            throw cmdError;
        }
    }
    return PARSE_ERR;
}

int MainWindow ::stmtNum(stmt_t Stmt){
    for(int i=0;i<9;i++){
        if(Stmt ==stmtTab[i]) return i;
    }
    return -1;
}

int MainWindow ::cmdNum(cmd_t Cmd){
    for(int i=0;i<6;i++){
        if(Cmd ==cmdTab[i]) return i;
    }
    return -1;
}

parse_t MainWindow:: parse_stmt(QString &ptr, stmt_t& stmt){
    QString tmp=ptr;
    tmp = tmp.trimmed();
    int index=-1; int i=0;
    if(IS_END(tmp)) return PARSE_ERR;
    for(i=0;i<9;i++){
        index = tmp.indexOf(stmtTab[i], 0,  Qt::CaseInsensitive);
        if(index==0) break;
    }
    if(index == 0) {
        stmt = stmtTab[i];
        ptr = ptr.mid(stmt.length()+1);
        return PARSE_STMT;
    }
    return PARSE_ERR;
}

parse_t MainWindow:: parse_cmd(QString &ptr, stmt_t& cmd){
    QString tmp=ptr;
    tmp = tmp.trimmed();
    int index=-1; int i=0;
    if(IS_END(tmp)) return PARSE_ERR;
    for(i=0;i<6;i++){
        index = tmp.indexOf(cmdTab[i], 0,  Qt::CaseInsensitive);
        if(index != -1) break;
    }

    if(index == 0) {
        cmd = cmdTab[i];
        ptr = tmp.mid(cmd.length());
        return PARSE_CMD;
    }
    return PARSE_ERR;
}

parse_t MainWindow:: parse_num(QString &ptr, int & val){
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

parse_t MainWindow:: parse_var(QString &ptr, QString& name){
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

parse_t MainWindow:: parse_exp(QString &ptr, QString& exp){
    // the if case needs extra consideration.
    QString tmp = ptr;
    tmp=tmp.trimmed();
    if(IS_END(tmp))return PARSE_ERR;
    tmp=tmp.remove(QRegExp("\\s"));//remove all the white space
    if(IS_END(tmp))return PARSE_ERR;
    //    if(!judge_infix(tmp.toStdString())) return PARSE_ERR;
    exp = tmp;
    ptr = "";
    return PARSE_EXP;
}

parse_t MainWindow:: parse_delim(QString &ptr, QString& delim){
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

parse_t MainWindow::parse_string(QString &ptr, QString &inputString){
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
        if(tmp.indexOf("\"",1) == -1)return PARSE_ERR;
        inputString = tmp.mid(0, tail+1);
        ptr = tmp.mid(tail+1);
        return PARSE_STR;
    }
    return PARSE_ERR;
}

stmt_t *  MainWindow::find_instr(QString name){return nullptr;}

bool MainWindow::judge_infix(string str)
{
    int temp=0;
    if(str[0]=='/'||str[0]=='*')
        return false;
    if(str[str.length()-1]<'0'&&str[str.length()-1]>'9' )
        return false;
    for(int i=0;i<str.length();i++)
    {
        if(str[i]=='(')
        {
            if(i==0&&(str[i+1]=='*'||str[i+1]=='/'))
                return false;
            else if(str[i-1]>='0'&&str[i-1]<='9' )
                return false;
            temp++;
        }
        else if(str[i]==')')
        {
            if(i==0)
                return false;
            else if(str[i-1]=='+'||str[i-1]=='*'||str[i-1]=='-'||str[i-1]=='/')
                return false;
            else if(str[i+1]>='0'&&str[i+1]<='9')
                return false;
            temp--;
        }
    }
    if(temp==0)
        return true;
    return false;
}





















