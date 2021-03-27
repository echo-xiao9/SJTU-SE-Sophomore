#ifndef DRAWSNAKE_H
#define DRAWSNAKE_H
#include "implementation.h"


class DrawSnake:public QWidget
{
    Q_OBJECT
public:
    DrawSnake();
    void updateSnakeAndFood(GridLocation point, deque<GridLocation> deque);

protected:
    void paintEvent(QPaintEvent *event);
private:
    GridLocation food;
    deque<GridLocation> deq;
};

#endif // DRAWSNAKE_H
