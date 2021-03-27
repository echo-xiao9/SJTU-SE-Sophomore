//绘制AI蛇和AI模式的地图
#include "drawsnake.h"



DrawSnake::DrawSnake()
{
    this->setFixedWidth(STANDARD_WIDTH);
    this->setFixedHeight(STANDARD_HEIGHT);

}

void DrawSnake::updateSnakeAndFood(GridLocation point, deque<GridLocation> deque)
{
    food = point;
    deq = deque;
}

void DrawSnake::paintEvent(QPaintEvent *event)
{
    QPainter painter(this);
    painter.setBrush(QBrush(QColor(193,221,234)));
    painter.drawRect(0, 0, width(), height());

    painter.setPen(QPen(QColor(137,201,151), SNAKE_WIDTH));
    painter.drawRect(QRect(STANDARD_MARGIN, STANDARD_MARGIN, width()-2*STANDARD_MARGIN, height()-2*STANDARD_MARGIN));

    painter.setPen(QPen(QColor(109,120,191), 1));
    painter.setBrush(QBrush(QColor(164,175,241)));

    for(deque<GridLocation>::iterator it=deq.begin();it!=deq.end();++it)
    {
        QRect rect1(STANDARD_MARGIN+it->x*SNAKE_WIDTH+SNAKE_WIDTH/2,
                    STANDARD_MARGIN+it->y*SNAKE_WIDTH+SNAKE_WIDTH/2, SNAKE_WIDTH-2, SNAKE_WIDTH-2);
        painter.drawRect(rect1);
    }

    painter.drawEllipse(STANDARD_MARGIN+food.x*SNAKE_WIDTH+SNAKE_WIDTH/2,
                        STANDARD_MARGIN+food.y*SNAKE_WIDTH+SNAKE_WIDTH/2, SNAKE_WIDTH, SNAKE_WIDTH);
}
