#include <QPainter>
#include "gamecontroller.h"
#include "snake.h"

static const qreal SNAKE_SIZE = TILE_SIZE;

Snake::Snake(GameController &controller,int num,bool saved,int hp, Snake* Other) :
    number(num),
    HP(3),
    head(0, 0),
    growing(7),
    speed(20),
    moveDirection(NoMove),
    controller(controller)
{
    if(saved==0){
    other = Other;
     QPoint h(0,0);
    tail<<h;
    }
    else{
        growing=0;
    }
}

QRectF Snake::boundingRect() const
{
    qreal minX = head.x();
    qreal minY = head.y();
    qreal maxX = head.x();
    qreal maxY = head.y();

    foreach (QPointF p, tail) {
        maxX = p.x() > maxX ? p.x() : maxX;
        maxY = p.y() > maxY ? p.y() : maxY;
        minX = p.x() < minX ? p.x() : minX;
        minY = p.y() < minY ? p.y() : minY;
    }
    //scene coordinate system to item system
    QPointF tl = mapFromScene(QPointF(minX, minY));
    QPointF br = mapFromScene(QPointF(maxX, maxY));

    QRectF bound = QRectF(tl.x(),  // x
                          tl.y(),  // y
                          br.x() - tl.x() + SNAKE_SIZE,      // width
                          br.y() - tl.y() + SNAKE_SIZE       //height
                          );
    return bound;
}

QPainterPath Snake::shape()
{
    //绘制蛇身体所需的函数
    QPainterPath path;
    path.setFillRule(Qt::WindingFill);
    path.addRect(QRectF(0, 0, SNAKE_SIZE, SNAKE_SIZE));
    foreach (QPointF p, tail) {
        QPointF itemp = mapFromScene(p);
        path.addRect(QRectF(itemp.x(), itemp.y(), SNAKE_SIZE, SNAKE_SIZE));
    }
    return path;
}

void Snake::paint(QPainter *painter, const QStyleOptionGraphicsItem *, QWidget *)
{
    painter->save();
    if(number==0)painter->fillPath(shape(), QColor(164,175,241));
    else painter->fillPath(shape(), QColor(209,73,78));

    painter->restore();
}

void Snake::setMoveDirection(Direction direction)
{//设置蛇的移动方向

    if (moveDirection == MoveLeft && direction == MoveRight)
        return;
    if (moveDirection == MoveRight && direction == MoveLeft)
        return;
    if (moveDirection == MoveUp && direction == MoveDown)
        return;
    if (moveDirection == MoveDown && direction == MoveUp)
        return;
    moveDirection = direction;
}

Snake::Direction Snake::currentDirection()
{
    return moveDirection;
}

void Snake::advance(int step)
{
    //控制蛇的前进
    if (!step) {
        return;
    }
    if (tickCounter++ % speed != 0) {
        //使用 speed 作为蛇的两次动作的间隔时间，
        //直接影响到游戏的难度。speed 值越大，
        //两次运动的间隔时间越大，游戏越简单。这是因为随着 speed 的增大
         //tickCounter % speed != 0 的次数响应越多，刷新的次数就会越少，蛇运动得越慢。
        return;
    }
    if (moveDirection == NoMove) {
        return;
    }

    if (growing > 0) {
        QPointF tailPoint = head;
        tail << tailPoint;  //This is an overloaded function.Appends value to the list.
        growing -= 1;
    } else {                    //handle case:growing = -1
        tail.removeFirst();
        tail << head;
    }

    switch (moveDirection) {
        case MoveLeft:
            moveLeft();
            break;
        case MoveRight:
            moveRight();
            break;
        case MoveUp:
            moveUp();
            break;
        case MoveDown:
            moveDown();
            break;
    }

    setPos(head);
    handleCollisions();
}

void Snake::moveLeft()
{
    head.rx() -= SNAKE_SIZE;
    if (head.rx() < -91) {
        head.rx() = 91;
    }
}

void Snake::moveRight()
{
    head.rx() += SNAKE_SIZE;
    if (head.rx() >= 91) {
        head.rx() = -91;
    }
}

void Snake::moveUp()
{
    head.ry() -= SNAKE_SIZE;
    if (head.ry() < -91) {
        head.ry() = 91;
    }
}

void Snake::moveDown()
{
    head.ry() += SNAKE_SIZE;
    if (head.ry() >= 91) {
        head.ry() = -91;
    }
}

void Snake::handleCollisions()
{
   //针对 wall,3种food进行碰撞的处理。
    //Returns a list of all items that collide with this item.
    QList<QGraphicsItem *> collisions = collidingItems();
    if(head.rx()>90||head.rx()<-90)controller.snakeHitWall(this);
    if(controller.mainWin->wallAround==1){
        if(head.ry()>90 || head.ry()<-90)controller.snakeHitWall(this);
    }
    // Check collisions with other objects on screen
    foreach (QGraphicsItem *collidingItem, collisions) {
      //  emit coliide(collidingItem->data(GD_Type),this);
        if (collidingItem->data(GD_Type) == GO_Food_Longer) {
            // Let GameController handle the event by putting another apple
            controller.snakeAteFood((Food *)collidingItem);
            growing += 1;
        }
        if (collidingItem->data(GD_Type) == GO_Food_Live) {
            // Let GameController handle the event by putting another apple
            controller.snakeAteFood((Food *)collidingItem);
            HP++;
        }
        if(collidingItem->data(GD_Type) == GO_Food_Faster){
            controller.snakeAteFood((Food *)collidingItem);
            speedUp();
      }

    }
    // Check snake eating itself

    if (tail.contains(head)) {
        controller.snakeAteItself();
        if(other!=nullptr && other->tail.contains(head))controller.snakeAteItself();
    }
    controller.mainWin->changeHpLabelText();
}

void Snake::speedUp(){
    //加速
    speed = speed -3;
}

void Snake::initialize(int hp){
    //蛇撞墙之后的状态初始化函数
    HP=hp;
    speed=20;
    growing=7;
    head.setX(0);
    head.setY(0);
    tail.clear();
}






