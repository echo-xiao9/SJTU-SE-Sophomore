#include "window.h"

MyWindow::MyWindow()
{
    minWin=new MainWindow(this);
    minWin->show();
}
void MyWindow::newMainWin(){
    delete minWin;
    minWin=new MainWindow(this);
    minWin->show();
}
