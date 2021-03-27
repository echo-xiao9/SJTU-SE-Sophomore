#ifndef AISNAKE_H
#define AISNAKE_H
#include "implementation.h"

class AiSnake:public QThread
{
    Q_OBJECT
public:
    AiSnake();
    void run();
    void initSnakeAndFood();   //初始化蛇和食物
    void moveSnake();               //移动蛇
    void feedFood();                  //喂食物
    int findPointInSnakeBody(GridLocation p, deque<GridLocation> deq);
    void getPointsNotInSnakeBodyAndFood(deque<GridLocation> &deq1);
    int detectCollision();           //检测是否发生碰撞
    int checkSnakePathValid();
    int followTail();
    int anyPossibleMove();
    void AI();                              //采用A*算法
    int getLevel();
    void setDirection(int dir);
    GridLocation getFoodPosition();
    deque<GridLocation> getSnakePosition();
    SquareGrid makeDiagram(deque<GridLocation> deq);
    SquareGrid makeDiagram1(deque<GridLocation> deq);
protected:

signals:
    void update();

private:
    void moveRight();
    void moveLeft();
    void moveUp();
    void moveDown();

    deque<GridLocation> deq;
    GridLocation food;
    int direction; //right: 0, up:1, left:2, down:3
    int level ;  //game level
    int x_max;  //the max x position of the snake
    int y_max;  //the max y position of the snake
};

//初始化随机数种子
void initRandSeed(void);

//生成随机数
int randomize(int min, int max);

#endif // AISNAKE_H
