#ifndef PUBLIC_H
#define PUBLIC_H

#include <QWidget>
#include <QPainter>
#include <QDebug>
#include <QKeyEvent>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <QThread>
#include <deque>
#include <unordered_map>

#include <iostream>
#include <iomanip>
#include <unordered_map>
#include <unordered_set>
#include <array>
#include <vector>
#include <utility>
#include <queue>
#include <tuple>
#include <algorithm>
#include <cstdlib>


using namespace  std;

const int TILE_SIZE = 5;

enum GameObjectsData {
    GD_Type
};

enum GameObjectTypes {
    GO_Food_Longer,
    GO_Food_Live,
    GO_Food_Faster,
    GO_Wall
};



//单元格的数据格式，x坐标和y坐标
struct GridLocation {
  int x, y;
};

//贪食蛇的移动方向，上下左右，如果计算不出移动方向，返回错误码
typedef  enum
{
    RIGHT = 0X01,
    LEFT  = 0X02,
    UP    = 0X03,
    DOWN  = 0X04,
    ERROR = 0xFF,
} DIRECTION;


//贪食蛇的游戏难度
typedef enum
{
	EASY = 500,
	MEDIUM = 250,
	DIFFICULT = 100,
    VERY_DIFFICULT = 30,
} GAMELEVEL;




//行列方格的个数，贪食蛇的宽度，边界的宽度，场景的宽和高
#define GRID_NUM       10
#define SNAKE_WIDTH    30
#define STANDARD_MARGIN 140

#define STANDARD_WIDTH (GRID_NUM * SNAKE_WIDTH + 3 * STANDARD_MARGIN)
#define STANDARD_HEIGHT STANDARD_WIDTH
#endif // PUBLIC_H
