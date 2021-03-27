#ifndef FOOD_H
#define FOOD_H
#include "public.h"
#include <QGraphicsItem>

class Food : public QGraphicsItem
{
public:
    Food(qreal x=20, qreal y=20,int type=0);
    int type;
    QRectF boundingRect() const;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *, QWidget *);
    QPainterPath shape() const;
    double x;
    double y;
};

#endif // FOOD_H
