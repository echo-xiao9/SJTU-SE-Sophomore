#include <QPainter>
#include "food.h"

static const qreal FOOD_RADIUS = 3.0;

Food::Food(qreal x1,qreal y1, int Type)
{
    setPos(x1, y1);
    type=Type;
    switch (type) {
    case 0:
        setData(GD_Type, GO_Food_Longer);
        break;
    case 1:
        setData(GD_Type, GO_Food_Faster);
        break;
    default:
        setData(GD_Type, GO_Food_Live);
        break;
    }
    x=x1;
    y=y1;
}

QRectF Food::boundingRect() const
{
    return QRectF(-TILE_SIZE,    -TILE_SIZE,
                   TILE_SIZE * 2, TILE_SIZE * 2 );
}

void Food::paint(QPainter *painter, const QStyleOptionGraphicsItem *, QWidget *)
{
    painter->save();
    painter->setRenderHint(QPainter::Antialiasing);
    switch (type) {
    case 0:
        painter->fillPath(shape(), QColor(247,107,58));
        break;
    case 1:
        painter->fillPath(shape(), QColor(246,176,77));
        break;
    case 2:
        painter->fillPath(shape(), QColor(241,94,132));
        break;
    }

    painter->restore();
}

QPainterPath Food::shape() const
{
    QPainterPath p;
    p.addEllipse(QPointF(TILE_SIZE / 2, TILE_SIZE / 2), FOOD_RADIUS, FOOD_RADIUS);
    return p;
}
