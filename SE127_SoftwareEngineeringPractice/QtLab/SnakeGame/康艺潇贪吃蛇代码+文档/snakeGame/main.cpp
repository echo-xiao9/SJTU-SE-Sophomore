#include "mainwindow.h"
#include "window.h"
#include <QApplication>
#include<QPalette>
class MyWindow;
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    MyWindow w;
    return a.exec();
}
