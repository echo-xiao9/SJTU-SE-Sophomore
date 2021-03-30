#include "MainWindow.h"
#include "ui_MainWindow.h"

#define IS_NUM(s) (s[0]>='0' && s[0]<='9')
#define IS_LETTER(s) ((s[0]>='a' && s[0]<='z') || (s[0]>='A' && s[0]<='Z'))
#define IS_COMMENT(s) (s[0]=='#')
#define IS_BLANK(s) (s[0]==' ' || s[0]=='\t')
#define IS_END(s) (s[0]=='\0')




MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(ui->clearButton,SIGNAL(clicked()),this,SLOT(on_clearButton_clicked()));
    connect(ui->codeLineEdit, SIGNAL(returnPressed()), this, SLOT(on_codeLineEdit_return()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::updateCodeBrowser(){
    QString appendLine="";
    auto iter = statements.begin();
    while (iter !=statements.end()) {
        QString singleStmt = iter->second->stmt;
        appendLine =QString(QString::number(iter->first))+'\t'+ iter->second->stmt;
        ++iter;
        ui->codeBrowser->append(appendLine);
    }
}

void MainWindow::updateResultBrowser(QString s){
    ui->codeBrowser->append(s);
}


void MainWindow::on_codeLineEdit_return(){
    QString input = ui->codeLineEdit ->text();
    ui->codeLineEdit->clear();
    ui->codeBrowser->clear();
    //input is a statement
    parse_line(input);
    updateCodeBrowser();
}

void MainWindow::on_clearButton_clicked(){
    ui->codeLineEdit->clear();
    ui->codeBrowser->clear();
    ui->resultBrowser->clear();
    ui->syntaxDisplayBroser->clear();
}

int MainWindow ::stmtNum(stmt_t Stmt){
    for(int i=0;i<8;i++){
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

parse_t MainWindow:: parse_line(QString &line){
    stmt_t stmtTmp;
    cmd_t cmdTmp;
    QString lineTmp=line;
    QString varName="";
    QString exp="";
    QString exp1="";
    QString delim="";
    pair<map<int, Statement*>::iterator, bool> Insert_Pair;
    Statement *newStmt;
    int lineNum=0;
    int numTmp=0;
    // is command
    if(IS_NUM(line)){ 
        if(parse_num(lineTmp,lineNum)==PARSE_ERR||
                parse_stmt(lineTmp, stmtTmp)==PARSE_ERR)
            return PARSE_ERR;
        switch (stmtNum(stmtTmp))
        {
        case 0: //"INPUT": 35 INPUT n3
          if(parse_var(lineTmp, varName) == PARSE_ERR) return PARSE_ERR;
              ui->codeBrowser->append("?");
              numTmp = ui->codeLineEdit ->text().toInt();
//              newStmt = new InputStmt(lineNum, varName, numTmp, statements);
              newStmt = new InputStmt(lineNum, varName,numTmp, variables);
          break;
        case 1://"LET": //40 LET total = n1 + n2 + n3
          if(parse_var(lineTmp, varName)==PARSE_ERR || 
              parse_delim(lineTmp, delim)==PARSE_ERR||
              delim !="="||
              parse_exp(lineTmp,exp)==PARSE_ERR)
              return PARSE_ERR;
              newStmt=new LetStmt(lineNum, varName, exp, variables);
          break;

        case 2: //"GOTO" GOTO n
          if(parse_num(lineTmp,numTmp)==PARSE_ERR)return PARSE_ERR;
          newStmt = new GotoStmt(lineNum, numTmp,variables);
          break;

        case 3://"IF":  //IF condition THEN n
          if(parse_exp(lineTmp, exp)==PARSE_ERR || 
          parse_exp(lineTmp,exp)==PARSE_ERR|| 
          parse_delim(lineTmp, delim)==PARSE_ERR||
          parse_exp(lineTmp,exp1)==PARSE_ERR||
          parse_stmt(lineTmp, stmtTmp)==PARSE_ERR||
          stmtTmp !="THEN"||
          parse_num(lineTmp, numTmp)==PARSE_ERR
          )return PARSE_ERR;
          newStmt = new IfStmt(lineNum, exp,  delim, exp1, numTmp,variables);

          break;

        case 4: //"PRINT": //PRINT 2 + 2
          if(parse_exp(lineTmp, exp)==PARSE_ERR)return PARSE_ERR;
          newStmt = new PrintStmt(lineNum,exp, variables);
          break;

        case 5: //"REM": //REM aaa
          newStmt = new RemStmt(lineNum,lineTmp,variables);
          break;

        case 6: //"END":

          break;

        default:
          break;
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
        if(parse_cmd(lineTmp, cmdTmp)==PARSE_ERR)return PARSE_ERR;
        switch (cmdNum(cmdTmp))
        {
        case 0://"RUN":
          
          break;
        case 1://"LOAD":
          
          break;
        case 2://"LIST":
          
          break;
        case 3: //"CLEAR":
          
          break;
        case 4: //"HELP":
          
          break;
        case 5: //"QUIT":
          
          break;
        default:
          break;
        }
      }



}
parse_t MainWindow:: parse_stmt(QString &ptr, stmt_t& stmt){
    QString tmp=ptr;
    tmp = tmp.trimmed();
    int index=-1; int i=0;
    if(IS_END(tmp)) return PARSE_ERR;
    for(i=0;i<8;i++){
        index = tmp.indexOf(stmtTab[i], 0,  Qt::CaseInsensitive);
        if(index != -1) break;
    }
    if(index == 0) {
        stmt = stmtTab[i];
        ptr = ptr.mid(stmt.length()+1);
        return PARSE_STMT;
    }
    return PARSE_ERR;
}

parse_t MainWindow:: parse_cmd(QString &ptr, stmt_t& cmd){
    QString tmp=ptr.toUpper();
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
    QString tmp = ptr.toUpper();int i=0;
    tmp=tmp.trimmed();
    if(IS_END(tmp))return PARSE_ERR;

    tmp=tmp.remove(QRegExp("\\s"));//remove all the white space
    if(IS_END(tmp))return PARSE_ERR;
    if(!judge_infix(tmp.toStdString())) return PARSE_ERR;
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
         return PARSE_DELIM;
     }
     return PARSE_ERR;
}
stmt_t *  MainWindow::find_instr(QString name){}

bool MainWindow::judge_infix(string str)
{
    int temp=0;
    if(str[0]=='/'||str[0]=='*')
        return false;
    if(str[str.length()-1]<'0'&&str[str.length()-1]>'9')
        return false;
    for(int i=0;i<str.length();i++)
    {
        if(str[i]=='(')
        {
            if(i==0&&(str[i+1]=='*'||str[i+1]=='/'))
                return false;
            else if(str[i-1]>='0'&&str[i-1]<='9')
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















void MainWindow::insertStat(QString stmt){
//    map<int, Statement*>::iterator iter;
//    pair<map<int, Statement*>::iterator, bool> Insert_Pair;
//    int index=0;int tmp=0;
//    QString type="";
//    QString statement="";
//    int flag=0;
//    Statement* newStmt;
//    //trim the statement,need try catch
//    stmt.trimmed();
//    QStringList strList = stmt.split(" ");

//    //get the index and the statement
//    index = strList[0].toInt();
//    tmp=stmt.indexOf(" ");
//    statement = stmt.mid(tmp,stmt.length()-tmp);
//    statement = statement.trimmed();
//    for(int i=0; i<14&& !flag; i++){
//        if (stmt.contains(stmtType[i]) && !flag) {
//            //string stmtType = ['INPUT','LET','GOTO','IF','PRINT','REM','END'];
//            if(i==0 || i==7) {
//                newStmt = new InputStmt(index, statement, variables);
//                flag=1;
//            }
//            if(i==1 || i==8) {
//                newStmt=new LetStmt(index, statement, variables);
//                flag=1;
//            }
//            if(i==2 || i==9) {
//                newStmt=new GotoStmt(index, statement, variables);
//                flag = 1;
//            }
//            if(i==3 || i==10) {newStmt=new IfStmt(index, statement, variables); flag=1;}
//            if(i==4 || i==11) {
//                newStmt=new PrintStmt(index, statement, variables);

//                flag=1;}
//            if(i==5 || i==12) {newStmt=new RemStmt(index, statement, variables);flag=1;}
//            if(i==6  || i==13) {newStmt=new EndStmt(index, statement, variables);flag=1;}
//        }
//    }

//   Insert_Pair = statements.insert(pair<int, Statement*>(index, newStmt));
//    // if the index exits
//    if(!Insert_Pair.second) {
//        iter = statements.find(index);
//         // if we can find the same index, replace it with the new one.
//        if(iter != statements.end()) statements.erase(iter);
//        Insert_Pair = statements.insert(pair<int, Statement*>(index, newStmt));
//    }
}



void MainWindow::loadStat(){
    QString fileName = QFileDialog::getOpenFileName();
    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)){
        qDebug()<<"can't open file"<<endl;
         return;
    }
    statements.clear();//clear current statements before loading
    QTextStream in(&file);
    QString line = in.readLine();
    while(!line.isNull()){//字符串有内容
    insertStat(line);
    line = in.readLine();
    }
    file.close();
}

