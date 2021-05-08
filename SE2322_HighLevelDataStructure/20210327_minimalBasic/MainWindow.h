#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFileDialog>
#include <QTextStream>
#include <QEventLoop>
#include <QTextBrowser>
#include "Statement.h"
#include "Help.h"
#include "DebugEnd.h"
#include "DebugError.h"

using namespace std;
extern vector<var>variables;

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

#define IS_NUM(s) (s[0]>='0' && s[0]<='9')
#define IS_LETTER(s) ((s[0]>='a' && s[0]<='z') || (s[0]>='A' && s[0]<='Z'))
#define IS_COMMENT(s) (s[0]=='#')
#define IS_BLANK(s) (s[0]==' ' || s[0]=='\t')
#define IS_END(s) (s[0]=='\0')
#define IS_OPERATOR(s) (s[0]=='+'|| s[0]== '-' ||  s[0]=='*' || s[0]=='/' || s[0]=='('  )


typedef enum { CON_ERR=-1, GREATER, EQUAL, LESS} condition_t;

typedef enum { NOTYPE=-1, ADD, SUB, MUL, DIV, EXP, LBRC, RBRC, NUM, VAR
             } token_t; // LBRC: left bracket RBRC: right bracket

typedef QString stmt_t  ;
typedef QString cmd_t  ;
typedef QString operator_t ;


class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    void updateCodeBrowser();
    void highLightErrorCode();
    void updateResultBrowser();
    void updateVarBrowser();
    void updateSyntaxDisplayBroser();
    // 0: INPUTS,1:INPUT, 2：LET, 3：GOTO, 4:IF,  5:PRINTF, 6: PRINT， 7:REM, 8:END,9:THEN
    stmt_t stmtTab[10] = {"INPUTS","INPUT","LET", "GOTO", "IF",  "PRINTF", "PRINT", "REM", "END","THEN" }; //all valid statement
    cmd_t cmdTab[6]={"RUN", "LOAD", "LIST", "CLEAR", "HELP","QUIT"}; // all valid command
    operator_t opTab[7]={"+", "-", "*", "/", "(", ")", "**" }; // all valid operator
    token_t optokenTab[7]={ ADD, SUB, MUL, DIV, LBRC, RBRC,EXP } ;
    vector <string> command;
    vector <QString> results;
    vector <QString> synTree;
    map <int, Statement*> statements; // store the existing statements after running the app
    int curLine;
    int curPos=0;
private:
    //App *app;
    Ui::MainWindow *ui;
    int stmtNum(stmt_t Stmt);//return -1 if can't find or return the number in stmtTab.
    int cmdNum(cmd_t Cmd);//return -1 if can't find or return the number in cmdTab.
    void showHelpWin();
    void drawTree();
    void drawSingleTree( map<int, Statement*>::iterator& it);
    void drawExpBranch(Exp *exp, int indentation);
    void recurPrintExp(Node *n,  int indentation);
    QEventLoop loop;
    QString inputNumTmp;
    QString inputStr;
    QList<QPair<int, QColor>> errorHighLights;
    QList<int>errorIndex;
    QTextBrowser* code;
    QTextCursor cursor;
    map<int, Statement*>::iterator debugIt;
    DebugEnd* debugEnd;
    DebugError *debugError;
private slots:
    void codeLineEdit_return();
    void clearAll();
    void clearAppStatus();
    void on_loadButton_clicked();
    void loadStat();
    void runApp();
    map<int, Statement*>::iterator runStmt(map<int, Statement*>::iterator &it);
    void getCodeLineVal();
    void getCodeLineStrVal();
    void debug();
    void stepIn();
    void toNormal();

    parse_t parse_line(QString &line);
    parse_t parse_stmt(QString &ptr, stmt_t& stmt);
    parse_t parse_cmd(QString &ptr, stmt_t& cmd);
    parse_t parse_num(QString &ptr, int & val);
    parse_t parse_var(QString &ptr, QString& name);
    parse_t parse_exp(QString &ptr, QString& exp);
    parse_t parse_delim(QString &ptr, QString& delim);
    parse_t parse_string(QString &ptr, QString &inputString);

    stmt_t  *find_instr(QString name);
    bool  judge_infix(string str);

};




#endif // MAINWINDOW_H
