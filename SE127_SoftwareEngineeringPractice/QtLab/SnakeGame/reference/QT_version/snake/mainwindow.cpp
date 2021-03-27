#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    snake = new DrawSnake;
    runSnake = new RunSnake;
    setCentralWidget(snake);
    runSnake->start();
    connect(this->runSnake, SIGNAL(update()), this, SLOT(updateSnakeAndFood()));
}

void MainWindow::updateSnakeAndFood()
{
    GridLocation food = runSnake->getFoodPosition();
    deque<GridLocation> deq = runSnake->getSnakePosition();
    snake->updateSnakeAndFood(food, deq);
    snake->repaint();
}

MainWindow::~MainWindow()
{
    delete snake;
    delete runSnake;
    delete ui;
}

void MainWindow::keyPressEvent(QKeyEvent *ev)
{
    int direction = -1;
    if(ev->key() == Qt::Key_Up)
    {
        direction = UP;
    }
    else if(ev->key() == Qt::Key_Down)
    {
        direction = DOWN;
    }
    else if(ev->key() == Qt::Key_Left)
    {
        direction = LEFT;
    }
    else if(ev->key() == Qt::Key_Right)
    {
        direction = RIGHT;
    }

    runSnake->setDirection(direction);

    QWidget::keyPressEvent(ev);

}



/**************************************
 * draw snake
 * run snake
 * mainwindow: draw snake, run snake, keyboard, 两个线程，一个用于控制贪食蛇，一个用于绘制窗体
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 * ****************************************/
