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

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    void updateCodeBrowser();
    void updateResultBrowser(QString s);
    ~MainWindow();

    QString stmtType[14] = {"INPUT","LET", "GOTO", "IF" ,"PRINT",
                            "REM", "END","input", "let", "goto", "if", "print", "rem","end"};
    vector <string> command;
    map <int, Statement*> statements;
    vector<Statement::var>variables;
    void insertStat(QString stmt);
    void loadStat();

private:
    //App *app;
    Ui::MainWindow *ui;
private slots:
    void on_codeLineEdit_return();
    void on_clearButton_clicked();


};

#endif // MAINWINDOW_H
