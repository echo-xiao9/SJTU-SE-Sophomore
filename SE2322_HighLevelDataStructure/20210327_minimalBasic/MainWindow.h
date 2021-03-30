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


typedef enum { PARSE_ERR=-1, PARSE_LINE, PARSE_STMT, PARSE_CMD, 
  PARSE_NUM, PARSE_VAR, PARSE_EXP, PARSE_DELIM} parse_t;
typedef enum { CON_ERR=-1, GREATER, EQUAL, LESS} condition_t;

typedef QString stmt_t  ;
typedef QString cmd_t  ;
typedef QChar operator_t ;
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
    operator_t opTab[6]={'+', '-', '*', '/', '(', ')' };

    vector <string> command;
    map <int, Statement*> statements;
    vector<Statement::var>variables;
    void insertStat(QString stmt);
    void loadStat();

private:
    //App *app;
    Ui::MainWindow *ui;
    int stmtNum(stmt_t Stmt);//return -1 if can't find or return the number in stmtTab.
    int cmdNum(cmd_t Cmd);//return -1 if can't find or return the number in cmdTab.
private slots:
    void on_codeLineEdit_return();
    void on_clearButton_clicked();

    parse_t parse_line(QString &line);
    parse_t parse_stmt(QString &ptr, stmt_t& stmt);
    parse_t parse_cmd(QString &ptr, stmt_t& cmd);
    parse_t parse_num(QString &ptr, int & val);
    parse_t parse_var(QString &ptr, QString& name);
    parse_t parse_exp(QString &ptr, QString& exp);
    parse_t parse_delim(QString &ptr, QString& delim);

    stmt_t  *find_instr(QString name);
   bool  judge_infix(string str);

};

#endif // MAINWINDOW_H
