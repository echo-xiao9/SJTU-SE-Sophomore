#ifndef SNAKE_H
#define SNAKE_H

#include <QGraphicsItem>
#include <QRectF>
#include "public.h"
class GameController;

class Snake : public QGraphicsItem
{
public:
    enum Direction {
        NoMove,
        MoveLeft,
        MoveRight,
        MoveUp,
        MoveDown
    };

    Snake(GameController & controller,int number,bool saved=0,int hp=3,Snake* other =nullptr);
    QRectF boundingRect() const;
    QPainterPath shape();
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *, QWidget *);
    char retHP(){char h=HP+'0'-0;return h;}
    void setMoveDirection(Direction direction);
	Direction currentDirection();
    Snake *other;
    int HP;
    void initialize(int hp);
    void advance(int step);

    QList<QPointF> tail;        //存储每个tail的位置
    int            growing;            //当前状态下是否需要伸长
    QPointF        head;
    int number;                       //蛇的编号
private:
    //四个方向移动函数
    void moveLeft();
    void moveRight();
    void moveUp();
    void moveDown();
    //处理和墙体，食物的碰撞
    void handleCollisions();
    void speedUp();         //加速
    QPainterPath path;
    int            speed;
    int            tickCounter;
    Direction      moveDirection;
    GameController &controller;
//signals:
//    void coliide(QVariant TYPE,Snake* s);
};

#endif // SNAKE_H
