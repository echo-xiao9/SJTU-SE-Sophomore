#ifndef WINDOW_H
#define WINDOW_H

#include"mainwindow.h"
class MainWindow;

class MyWindow
{
public:
    MyWindow();
public slots:
    void newMainWin();
private:
    MainWindow* minWin;
};

#endif // WINDOW_H
