#include "AiSnake.h"

int checkDirection(GridLocation current, GridLocation next);
GridLocation chooseShortestWay(SquareGrid grid, GridLocation snakeHead,
                        std::unordered_map<GridLocation, double> cost_so_far);
GridLocation chooseLongestWay(SquareGrid grid, GridLocation snakeHead,
                       std::unordered_map<GridLocation, double> cost_so_far);

//初始化随机数种子
void initRandSeed(void)
{
    srand(static_cast<unsigned int>(time(nullptr)));
    rand();
    rand();
}

//生成随机数
int randomize(int max)
{
    int number = rand() % max;
    return number;
}


AiSnake::AiSnake()
{
    initRandSeed();
    initSnakeAndFood();
    level = VERY_DIFFICULT;
}


int AiSnake::getLevel()
{
    return level;
}

void AiSnake::initSnakeAndFood()        //初始化蛇和食物
{
    x_max = (STANDARD_WIDTH - 2*STANDARD_MARGIN)/SNAKE_WIDTH-2;
    y_max = x_max;

    int initPointArr[3][2] = {{x_max-1, y_max/2}, {x_max-2, y_max/2}, {x_max-3, y_max/2}};
    direction = RIGHT;
    for(int i=0;i<sizeof(initPointArr)/sizeof(initPointArr[0]);i++)
    {
        GridLocation p1;
        p1.x = initPointArr[i][0];
        p1.y = initPointArr[i][1];
        deq.push_back(p1);
    }
    feedFood();
}


void AiSnake::moveRight()
{
    GridLocation p1 = deq.front();

    //是否碰到食物,碰到食物，就将贪食蛇加1段长度
    if(food.x == p1.x+1 && food.y == p1.y)
    {
        deq.push_front(food);
        feedFood();
    }
    else
    {
        p1.x = p1.x + 1;
        deq.push_front(p1);
        deq.pop_back();
    }
}

void AiSnake::moveLeft()
{
    GridLocation p1 = deq.front();

    //是否碰到食物,碰到食物，就将贪食蛇加1段长度
    if(food.x == p1.x-1 && food.y == p1.y)
    {
        deq.push_front(food);
        feedFood();
    }
    else
    {
        p1.x = p1.x - 1;
        deq.push_front(p1);
        deq.pop_back();
    }
}

void AiSnake::moveUp()
{
    GridLocation p1 = deq.front();

    //是否碰到食物,碰到食物，就将贪食蛇加1段长度
    if(food.y == p1.y-1 && food.x == p1.x)
    {
        deq.push_front(food);
        feedFood();
    }
    else
    {
        p1.y = p1.y - 1;
        deq.push_front(p1);
        deq.pop_back();
    }
}

void AiSnake::moveDown()
{
    GridLocation p1 = deq.front();

    //是否碰到食物,碰到食物，就将贪食蛇加1段长度
    if(food.y == p1.y+1 && food.x == p1.x)
    {
        deq.push_front(food);
        feedFood();
    }
    else
    {
        p1.y = p1.y + 1;
        deq.push_front(p1);
        deq.pop_back();
    }
}

void AiSnake::moveSnake()          //移动蛇
{
    switch(direction)
    {
        case RIGHT:
            moveRight();
            break;
        case LEFT:
            moveLeft();
            break;
        case UP:
            moveUp();
            break;
        case DOWN:
            moveDown();
            break;
        default:
            break;
    }
}


int AiSnake::detectCollision()     //检测是否发生碰撞
{
    int horiMargin = (STANDARD_WIDTH-2*STANDARD_MARGIN) / SNAKE_WIDTH - 1;
    int vertiMargin = horiMargin;

    for(deque<GridLocation>::iterator it=deq.begin();it!=deq.end();++it)
    {
        if(it->x < horiMargin && it->x >= 0
                && it->y < vertiMargin && it->y >= 0)
        {
            //如果蛇进入了自己的身体,也是GAME OVER
            for(deque<GridLocation>::iterator it1=deq.begin();it1!=deq.end();++it1)
            {
                if(it != it1)
                {
                    if(it1->x == it->x && it1->y == it->y)
                    {
                        return -1;
                    }
                }
            }
        }//如果碰到边界，就是GAME OVER
        else
        {
            return -1;
        }
    }

    return 0;
}

void AiSnake::feedFood()                //喂食物
{
    bool isFoodValid = true;
    do
    {
        isFoodValid = true;
        food.x = randomize(x_max+1);
        food.y = randomize(y_max+1);

        //查找食物是否在贪食蛇身体内
        for (deque<GridLocation>::iterator it=deq.begin();it!=deq.end();it++)
        {
            if(it->x == food.x && it->y == food.y)
            {
                isFoodValid = false;
                break;
            }
        }
    }while(!isFoodValid);
}


void AiSnake::setDirection(int dir)
{
    if(dir == -1)
        return;
    direction = dir;
}

int isTimeArrived(struct timeval lasttime, struct timeval currenttime, int settime)
{
    if(currenttime.tv_sec*1000+currenttime.tv_usec/1000
            - (lasttime.tv_sec*1000+lasttime.tv_usec/1000) > settime)
    {
        return true;
    }
    else {
        return false;
    }
}

void AiSnake::run()
{
    struct timeval currenttime;
    struct timeval lasttime;
    gettimeofday(&currenttime, nullptr);
    lasttime = currenttime;

    while(1)
    {
        usleep(static_cast<unsigned long>(1000*level/2));
        gettimeofday(&currenttime, nullptr);
        if(isTimeArrived(lasttime, currenttime, level))
        {
            lasttime = currenttime;
            //1、通过AI人工智能决定下一步蛇的行走方向，上下左右
            AI();
            //2、移动蛇
            moveSnake();

            //3、检测是否发生碰撞，包括和蛇头与墙体碰撞和蛇头与蛇身碰撞
            if(detectCollision() == -1)
            {
                printf("collision occurred.\n");
                break;
            }
            else
            {
                emit update();
            }
        }
    }
}

SquareGrid AiSnake::makeDiagram(deque<GridLocation> deq)
{
  SquareGrid grid(x_max+1, y_max+1);
  for (deque<GridLocation>::iterator it=deq.begin();it!=deq.end();++it)
  {
      grid.walls.insert(GridLocation{it->x, it->y});
  }
  return grid;
}

SquareGrid AiSnake::makeDiagram1(deque<GridLocation> deq)
{
  SquareGrid grid(x_max+1, y_max+1);
  for (deque<GridLocation>::iterator it=deq.begin();it!=deq.end();++it)
  {
      grid.walls.insert(GridLocation{it->x, it->y});
  }

  grid.walls.insert(food);
  return grid;
}


void calculateSnakeBody(deque<GridLocation> &deq1, std::deque<GridLocation> deq, std::vector<GridLocation> snakePath)
{
    //测试当贪食蛇到达食物位置时，贪食蛇的头部能不能到达贪食蛇的尾部
    std::reverse(snakePath.begin(), snakePath.end());

    int pathsz = static_cast<int>(snakePath.size());
    int deqsz = static_cast<int>(deq.size());

    if(pathsz > deqsz)
    {
        for (unsigned int i=0;i<static_cast<unsigned int>(deqsz+1);++i)
        {
            deq1.push_back(snakePath.at(i));
        }
    }
    else
    {
        for (unsigned int i=0;i<static_cast<unsigned int>(pathsz);++i)
        {
            deq1.push_back(snakePath.at(i));
        }

        for (unsigned int i=1;i<=static_cast<unsigned int>(deqsz-pathsz+1);++i)
        {
            deq1.push_back(deq.at(i));
        }
    }
}

//检测贪食蛇的路径是否是有效的路径，需要保证贪食蛇能够到达指定位置，且到达指定位置后，贪食蛇还能够到达自己的尾部
//这样就能够保证贪食蛇不会把自己困住
int AiSnake::checkSnakePathValid()
{
    SquareGrid grid = makeDiagram(deq);

    GridLocation start{deq.begin()->x, deq.begin()->y};
    GridLocation goal{food.x, food.y};

    std::unordered_map<GridLocation, GridLocation> came_from;
    std::unordered_map<GridLocation, double> cost_so_far;

    //采用广度优先路径搜索算法，求出从食物到达蛇头的路径，如果成功找到路径，则返回1，否则返回0
    //权重的定义：格子到该食物，最短还需要几步。
    //为什么要以食物为中心算蛇头的权重，反向求路径，因为这样才能找到从蛇头出发的最长路径和最短路径，如果 正向求路径，
    //则蛇头周围的权重都一样，没法区分最长最短。
    int ret = breadth_first_search(grid, came_from, cost_so_far, goal, start);
    //查看蛇头是否到达食物后，是否蛇头能够到达蛇尾
    if(ret)
    {
        GridLocation nextMove = chooseShortestWay(grid, start, cost_so_far);
        if(nextMove.x == -1 && nextMove.y == -1)
        {
            return 0;
        }

        //根据广度优先路径搜索算法计算的结果拼接出从起点到终点的路径
        std::vector<GridLocation> path;
        reconstruct_path_1(path, food, nextMove, start, came_from);

        std::deque<GridLocation> deq1;
        calculateSnakeBody(deq1, deq, path);

        GridLocation newStart, newGoal;
        newStart = deq1.front();
        newGoal  = deq1.back();

        SquareGrid grid1 = makeDiagram(deq1);

        ret = breadth_first_search(grid1, came_from, cost_so_far, newGoal, newStart);

        //可以找到尾部
        if(ret)
        {
            GridLocation nextMove1 = chooseLongestWay(grid1, newStart, cost_so_far);

            if(nextMove1.x == -1 && nextMove1.y == -1)
            {
                return 0;
            }
            else
            {
                reconstruct_path_1(path, newGoal, nextMove1, newStart, came_from);
                //头尾相接
                if(nextMove1 == newGoal && path.size() > 4)
                {
                    return 0;
                }
                else
                {
                    direction = checkDirection(start, nextMove);
                }
            }

        }//找不到尾部
        else
        {  }
    }
    else
    {  }

    return ret;
}

int AiSnake::followTail()
{
    SquareGrid grid = makeDiagram1(deq);

    GridLocation start{deq.front().x, deq.front().y};//head
    GridLocation goal{deq.back().x, deq.back().y};//tail
    std::unordered_map<GridLocation, GridLocation> came_from;
    std::unordered_map<GridLocation, double> cost_so_far;

    //采用广度优先路径搜索算法，求出从蛇尾到达蛇头的路径，如果成功找到路径，则返回1，否则返回0
    //为什么要反向求路径，因为这样才能找到从蛇头出发的最长路径和最短路径，如果 正向求路径，
    //则蛇头周围的权重都一样，没法区分最长最短。
    int ret = breadth_first_search(grid, came_from, cost_so_far, goal, start);
    if(ret)
    {
        GridLocation nextMove = chooseLongestWay(grid, start, cost_so_far);

        if(nextMove.x == -1 && nextMove.y == -1)
        {
            return 0;
        }

        std::vector<GridLocation> path;
        reconstruct_path_1(path, goal, nextMove, start, came_from);
        if(nextMove == goal )//碰到蛇尾
        {
            return 0;
        }
        else
        {
            direction = checkDirection(start, nextMove);
        }
    }
    return ret;
}

int AiSnake::anyPossibleMove()
{
    printf("anyPossibleMove\n");
    return 0;
}

void AiSnake::AI()
{
    //1、先派出一条虚拟蛇（即查找是否存在这样的一条路径）去吃食物，虚拟蛇吃完之后到达食物后蛇头还能够到达蛇尾
    int ret = checkSnakePathValid();
    //2、如果没有这条路径，就查找从蛇头到达蛇尾的有效路径
    if(!ret)
    {
        ret = followTail();
    }

    //3、如果上面两个都不存在随意走一步，就随便走一步。
    if(!ret)
    {
        ret = anyPossibleMove();
    }
}

void AiSnake::getPointsNotInSnakeBodyAndFood(deque<GridLocation> &deq1)
{
    for(int i=0;i<=x_max;i++)
    {
        for(int j=0;j<=y_max;j++)
        {
            GridLocation p{i, j};

            //排除掉食物的位置和贪食蛇的身体的位置
            if(p.x == food.x && p.y == food.y)
            {
                continue;
            }
            else if(findPointInSnakeBody(p, deq))
            {
                continue;
            }
            else
            {
                deq1.push_back(p);
            }
        }
    }
}


int AiSnake::findPointInSnakeBody(GridLocation p, deque<GridLocation> deq)
{
    for(deque<GridLocation>::iterator it=deq.begin();it!=deq.end();++it)
    {
        if(p.x == it->x && p.y == it->y)
        {
            return 1;
        }
        else
        {
            continue;
        }
    }

    return 0;
}


GridLocation AiSnake::getFoodPosition()
{
    return food;
}

deque<GridLocation> AiSnake::getSnakePosition()
{
    return deq;
}


int checkDirection(GridLocation current, GridLocation next)
{
    if(next.x - current.x > 0)
        return RIGHT;
    else if(next.x - current.x < 0)
        return LEFT;
    else if(next.y - current.y > 0)
        return  DOWN;
    else if(next.y - current.y < 0)
        return UP;

    return ERROR;
}

GridLocation chooseShortestWay(SquareGrid grid, GridLocation snakeHead,
                        std::unordered_map<GridLocation, double> cost_so_far)
{

    int min = INT_MAX;
    GridLocation nextMove{-1, -1};
    for(GridLocation next: grid.neighbors(snakeHead))
    {
        if(cost_so_far.find(next) != cost_so_far.end() && min > cost_so_far[next])
        {
            min = static_cast<int>(cost_so_far[next]);
            nextMove = next;
        }
    }
    return nextMove;
}

GridLocation chooseLongestWay(SquareGrid grid, GridLocation snakeHead,
                       std::unordered_map<GridLocation, double> cost_so_far)
{
    int max = -INT_MAX;
    GridLocation nextMove{-1, -1};
    for(GridLocation next: grid.neighbors(snakeHead))
    {
        if(cost_so_far.find(next) != cost_so_far.end() && max < cost_so_far[next])
        {
            max = static_cast<int>(cost_so_far[next]);
            nextMove = next;
        }
    }

    return nextMove;
}
