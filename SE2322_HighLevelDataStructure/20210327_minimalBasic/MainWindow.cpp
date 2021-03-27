#include "MainWindow.h"
#include "ui_MainWindow.h"


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
        appendLine =QString(QString::number(iter->first))+' '+ iter->second->stmt;
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
    try {
        if(input[0]>='0'&&input[0]<='9'){
        insertStat(input);

        }

        else{
            string tmp = input.toStdString();
            switch (tmp[0]) {
            //there is try catch !
            case 'L' :case 'l':
                loadStat();
                break;
            }
        }
        updateCodeBrowser();
    }  catch (ExpException e) {
        return;
    }
    //input is a command
}

void MainWindow::on_clearButton_clicked(){
    ui->codeLineEdit->clear();
    ui->codeBrowser->clear();
    ui->resultBrowser->clear();
    ui->syntaxDisplayBroser->clear();
}


void MainWindow::insertStat(QString stmt){
    map<int, Statement*>::iterator iter;
    pair<map<int, Statement*>::iterator, bool> Insert_Pair;
    int index=0;int tmp=0;
    QString type="";
    QString statement="";
    int flag=0;
    Statement* newStmt;
    //trim the statement,need try catch
    stmt.trimmed();
    QStringList strList = stmt.split(" ");

    //get the index and the statement
    index = strList[0].toInt();
    tmp=stmt.indexOf(" ");
    statement = stmt.mid(tmp,stmt.length()-tmp);
    statement = statement.trimmed();
    for(int i=0; i<14&& !flag; i++){
        if (stmt.contains(stmtType[i]) && !flag) {
            //string stmtType = ['INPUT','LET','GOTO','IF','PRINT','REM','END'];
            if(i==0 || i==7) {
                newStmt = new InputStmt(index, statement, variables);
                flag=1;
            }
            if(i==1 || i==8) {
                newStmt=new LetStmt(index, statement, variables);
                flag=1;


            }
            if(i==2 || i==9) {
                newStmt=new GotoStmt(index, statement, variables);
                flag = 1;
            }
            if(i==3 || i==10) {newStmt=new IfStmt(index, statement, variables); flag=1;}
            if(i==4 || i==11) {
                newStmt=new PrintStmt(index, statement, variables);

                flag=1;}
            if(i==5 || i==12) {newStmt=new RemStmt(index, statement, variables);flag=1;}
            if(i==6  || i==13) {newStmt=new EndStmt(index, statement, variables);flag=1;}
        }
    }

   Insert_Pair = statements.insert(pair<int, Statement*>(index, newStmt));
    // if the index exits
    if(!Insert_Pair.second) {
        iter = statements.find(index);
         // if we can find the same index, replace it with the new one.
        if(iter != statements.end()) statements.erase(iter);
        Insert_Pair = statements.insert(pair<int, Statement*>(index, newStmt));
    }
}

//void MainWindow::traverseStat(){
//    auto iter = statements.begin();
//        while (iter != statements.end()) {
//            cout << "[" << iter->first << ","
//                         <<  iter->second.stmt<<"]\n";
//            ++iter;
//        }
//}


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

