#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "drawsnake.h"
#include "runsnake.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
protected:
    void keyPressEvent(QKeyEvent *ev);
public slots:
    void updateSnakeAndFood();

private:
    Ui::MainWindow *ui;
    DrawSnake *snake;
    RunSnake *runSnake;
};

#endif // MAINWINDOW_H
