#include <QEvent>
#include <QGraphicsScene>
#include <QKeyEvent>
#include <QMessageBox>
#include <QAction>
#include <iostream>
#include "gamecontroller.h"
#include "mainwindow.h"
#include <QDebug>
#include<QTime>
#include<string>
#include<QString>
#include<QDebug>
#include <fstream>
#include <iostream>

GameController::GameController(QGraphicsScene &scene,MainWindow *MainWin, QObject *parent) :
    QObject(parent),
    begin(0),
    mainWin(MainWin),
    snake(new Snake(*this,0)),
    snake2(nullptr),
    scene(scene),
    isPause(false)
{
    snakeNum=1;
    timer.start( 1000/100 );
    int x1[3]={0};int y1[3]={0};
    snake2 = nullptr;
    //将食物和第一条蛇添加到场景中
    for(int i=0;i<3;i++){
        addNewFood(i);
    }
    scene.addItem(snake);
    scene.installEventFilter(this);
    connect(&timer, SIGNAL(timeout()), &scene, SLOT(advance()));
}

GameController::~GameController()
{
}

void GameController::addSnake(bool draw){
    //添加第二条蛇
    snakeNum = 2;
    snake2=(new Snake(*this,draw));
    if(draw)scene.addItem(snake2);
    snake->other = snake2;
    snake2->other = snake;
}

void GameController::snakeAteFood(Food *food)
{
    //如果蛇吃到食物，就把该食物从场景中移除，并且添加同类型的食物
    scene.removeItem(food);
    addNewFood(food->type);
}

void GameController::snakeHitWall(Snake *s)
{
    //如果蛇碰到墙，生命值（hp)-1,并且蛇的状态初始化，从（0，0）开始，长度变短，hpLabel更新
    s->HP--;
    if((snake2==nullptr &&s->HP <= 0)||(snake2 !=nullptr &&( s->HP==0 ||s->other->HP <=0))){
        QTimer::singleShot(0, this, SLOT(gameOver()));
    }
    else s->initialize(s->HP);
    mainWin->changeHpLabelText();
}

void GameController::snakeAteItself()
{
    if(snake->HP)snake->HP -= 1;
    else QTimer::singleShot(0, this, SLOT(gameOver()));
}

void GameController::handleKeyPressed(QKeyEvent *event)
{
    //处理按键事件
    if (!isPause&&begin)
        switch (event->key()) {
        case Qt::Key_Left:
            snake->setMoveDirection(Snake::MoveLeft);
            break;
        case Qt::Key_Right:
            snake->setMoveDirection(Snake::MoveRight);
            break;
        case Qt::Key_Up:
            snake->setMoveDirection(Snake::MoveUp);
            break;
        case Qt::Key_Down:
            snake->setMoveDirection(Snake::MoveDown);
            break;
        case Qt::Key_A:
            snake2->setMoveDirection(Snake::MoveLeft);
            break;
        case Qt::Key_D:
            snake2->setMoveDirection(Snake::MoveRight);
            break;
        case Qt::Key_W:
            snake2->setMoveDirection(Snake::MoveUp);
            break;
        case Qt::Key_S:
            snake2->setMoveDirection(Snake::MoveDown);
            break;
        case Qt::Key_Space:
            pause();
            break;

        }
    else resume();
}



void GameController::addNewFood(int type,int x1,int y1)
{
    //添加新食物
    int x, y,t;
    if(x1==1000&& y1==1000){
        do {
            x = (int)(qrand() % 200) / 10 - 10;
            y = (int)(qrand() % 200) / 10 - 10;
            t=(int)(qrand() %3);
            x *= 9;
            y *= 9;
        } while (snake->shape().contains(snake->mapFromScene(QPointF(x + 5, y + 5))));
        //使用一个循环，直到找到一个不在蛇身体中的坐标。
        //shape()返回元素坐标系中的坐标，而我们计算而得的 x，y 坐标位于场景坐标系，
        //因此我们必须利用QGraphicsItem::mapFromScene()将场景坐标系映射为元素坐标系。
    }
    else {
        x=x1;y=y1;
    }
    Food *food = new Food(x, y,type);
    foodList<<food;
    scene.addItem(food);
}

void GameController::changeFoodPos(int fx[],int fy[]){
    //改变食物位置
    for(int i=0;i<3;i++){
         scene.removeItem(foodList[i]);
    }
    foodList.clear();
   for(int i=0;i<3;i++){
       addNewFood(i,fx[i],fy[i]);
   }
}




void GameController::gameOver()
{
    //处理游戏结束事件
    disconnect(&timer, SIGNAL(timeout()), &scene, SLOT(advance()));
  //  if(snake->HP==0)
    if (QMessageBox::Yes == QMessageBox::information(NULL,
                            tr("Game Over"), tr("Again?"),
                            QMessageBox::Yes | QMessageBox::No,
                            QMessageBox::Yes)) {
        connect(&timer, SIGNAL(timeout()), &scene, SLOT(advance()));
        scene.clear();
        int num = snake->number;
        snake = new Snake(*this,num);
        scene.addItem(snake);
        mainWin-> scene->addRect(QRect(-95,-95,5,190),QPen(QColor(137,201,151)),QBrush(QColor(137,201,151)));
         mainWin-> scene->addRect(QRect(95,-95,5,190),QPen(QColor(137,201,151)),QBrush(QColor(137,201,151)));
        mainWin->setvis(true);
        for(int i=0;i<3;i++) addNewFood(i);
    } else {
        exit(0);
    }
}


void GameController::pause()
{
    //暂停
    disconnect(&timer, SIGNAL(timeout()),
               &scene, SLOT(advance()));
    isPause = true;
    setResume();
    ofstream outfile;

    save();
    setResume();
  }

void GameController::save(){
    //保存当前地图和蛇的状态及分数
    ofstream outfile;
    outfile.open("state.txt");
    //保存蛇的条数
    if(snake2) outfile << 2 << endl;
    else outfile << 1 << endl;
    outfile << snake->tail.length() << endl;
     if(snake2) outfile << snake2->tail.length() << endl;
     else outfile << 0<<endl;
    for(int i=0;i<snake->tail.length();i++){
        outfile << snake->tail[i].rx()<<" "<<snake->tail[i].ry()<< endl;
    }
    if(snake2){
        for(int i=0;i<snake2->tail.length();i++){
            outfile << snake2->tail[i].rx()<<" "<<snake->tail[i].ry()<< endl;
        }
    }
    for(int i=0;i<3;i++)
        outfile <<foodList[i]->type<<" " <<foodList[i]->x << " "<<foodList[i]->y<<endl;
    outfile << snake->HP<<endl;
    if(snake2) outfile << snake2 -> HP<<endl;
    else outfile <<0<<endl;
    outfile.close();
    setResume();
}


void GameController::resume()
{
    //继续游戏
    connect(&timer, SIGNAL(timeout()), &scene, SLOT(advance()));
   isPause = false;
   setResume();
}

void GameController :: setResume(){
    if(isPause == true){
        resumeAction->setEnabled(true);
    }else{
        resumeAction->setEnabled(false);
    }
}

bool GameController::eventFilter(QObject *object, QEvent *event)
{
    if (event->type() == QEvent::KeyPress) {
        handleKeyPressed((QKeyEvent *)event);
        return true;
    } else {
        return QObject::eventFilter(object, event);
    }
}







