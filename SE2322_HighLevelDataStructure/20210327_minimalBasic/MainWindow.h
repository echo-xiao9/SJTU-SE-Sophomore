#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFileDialog>
#include <QTextStream>
#include "Statement.h"
//#include "App.h"
using namespace std;

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

#define IS_NUM(s) (s[0]>='0' && s[0]<='9')
#define IS_LETTER(s) ((s[0]>='a' && s[0]<='z') || (s[0]>='A' && s[0]<='Z'))
#define IS_COMMENT(s) (s[0]=='#')
#define IS_BLANK(s) (s[0]==' ' || s[0]=='\t')
#define IS_END(s) (s[0]=='\0')
#define IS_OPERATOR(s) (s[0]=='+'|| s[0]== '-' ||  s[0]=='*' || s[0]=='/' || s[0]=='('  )


typedef enum { PARSE_ERR=-1, PARSE_LINE, PARSE_STMT, PARSE_CMD, 
  PARSE_NUM, PARSE_VAR, PARSE_EXP, PARSE_CON, PARSE_OP} parse_t;

typedef enum { CON_ERR=-1, GREATER, EQUAL, LESS} condition_t;

typedef enum { NOTYPE=-1, ADD, SUB, MUL, DIV, EXP, LBRC, RBRC, NUM, VAR
  } token_t; // LBRC: left bracket RBRC: right bracket

typedef QString stmt_t  ;
typedef QString cmd_t  ;
typedef QString operator_t ;


class Token{
public:
    QString name="";
    int value=0;
    token_t type= NOTYPE;
};


class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    void updateCodeBrowser();
    void updateResultBrowser(QString s);


    stmt_t stmtTab[8] = {"INPUT","LET", "GOTO", "IF" , "PRINT",
                            "REM", "END","THEN"};
    cmd_t cmdTab[6]={"RUN", "LOAD", "LIST", "CLEAR", "HELP","QUIT"};
    operator_t opTab[7]={"+", "-", "*", "/", "(", ")", "**" };
    token_t optokenTab[7]={ ADD, SUB, MUL, DIV, LBRC, RBRC,EXP } ;
    vector <string> command;
    map <int, Statement*> statements;
    vector<Statement::var>variables;

private:
    //App *app;
    Ui::MainWindow *ui;
    int stmtNum(stmt_t Stmt);//return -1 if can't find or return the number in stmtTab.
    int cmdNum(cmd_t Cmd);//return -1 if can't find or return the number in cmdTab.
private slots:
    void on_codeLineEdit_return();
    void clearAll();
    void on_loadButton_clicked();
    void loadStat();

    parse_t parse_line(QString &line);
    parse_t parse_stmt(QString &ptr, stmt_t& stmt);
    parse_t parse_cmd(QString &ptr, stmt_t& cmd);
    parse_t parse_num(QString &ptr, int & val);
    parse_t parse_var(QString &ptr, QString& name);
    parse_t parse_exp(QString &ptr, vector<Token> &expInputVec);
    parse_t parse_delim(QString &ptr, QString& delim);

    stmt_t  *find_instr(QString name);
   bool  judge_infix(string str);

};




#endif // MAINWINDOW_H
