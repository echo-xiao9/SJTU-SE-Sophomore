#ifndef GAMECONTROLLER_H
#define GAMECONTROLLER_H

#include <QObject>
#include <QTimer>
#include <QAction>
#include "mainwindow.h"

class QGraphicsScene;
class QKeyEvent;
class Snake;
class Food;
class Wall;
class MainWindow;
//用户控制类

class GameController : public QObject
{
    Q_OBJECT
public:
   // GameController(QGraphicsScene &scene, QObject *parent,MainWindow* MainWin) ;
    GameController(QGraphicsScene &scene, MainWindow *MainWin,QObject *parent) ;
    ~GameController();
    void snakeAteFood(Food *food);
    void snakeHitWall(Snake *s);
    void snakeAteItself();
    QAction *getResmueAction(){ return resumeAction;}
    void setResumeAction(QAction* r){ resumeAction = r; }
    bool begin;

    void addSnake(bool draw=true);
    MainWindow *mainWin;
    Snake *snake;
    Snake *snake2;
    QList<Food*> foodList;
    QList<Wall*> middleWallList;
    Wall *wall;

    void changeFoodPos(int fx[],int fy[]);


public slots:
    void pause();
    void resume();
    void gameOver();
    void save();

protected:
     bool eventFilter(QObject *object, QEvent *event);

private:
    void handleKeyPressed(QKeyEvent *event);
    void addNewFood(int type,int x1=1000,int y1=1000);
//    void addNewWall(int x1=1000,int y1=1000);
    void setResume();

    QAction * resumeAction;
    QTimer timer;
    QGraphicsScene &scene;
    bool isPause;
    int snakeNum;
};

#endif // GAMECONTROLLER_H
