
#include "mainwindow.h"


MainWindow::MainWindow(MyWindow*w,QWidget *parent )
    : QMainWindow(parent),
      ui(new Ui::MainWindow),
      scene(new QGraphicsScene(this)),
      view(new QGraphicsView(scene, this))
{
    ui->setupUi(this);
    setCentralWidget(view);
    setFixedSize(700, 700);
    wallAround=1;
    win=w;
    //set play mode

    oneModeButton= new QPushButton("One Player Mode", this);
    twoModeButton= new QPushButton("Two Player Mode", this);
    autoPlayButton= new QPushButton(" Auto Play Mode", this);
    continuePlayButton= new QPushButton(" Continue Play Mode", this);
    editMapButton= new QPushButton(" Edit Map", this);
    // set size and location of the button
    oneModeButton->setGeometry(QRect(QPoint(260, 100), QSize(200, 50)));
    twoModeButton->setGeometry(QRect(QPoint(260, 200), QSize(200, 50)));
    autoPlayButton->setGeometry(QRect(QPoint(260, 300), QSize(200, 50)));
    continuePlayButton ->setGeometry(QRect(QPoint(260, 400), QSize(200, 50)));
    editMapButton ->setGeometry(QRect(QPoint(260, 500), QSize(200, 50)));
    game=new GameController(*scene,this,this);

    //提示生命值的label
    hpLabel = new QLabel(this);
    hpLabel ->setGeometry(QRect(QPoint(40, 40), QSize(100, 100)));
    //提示食物作用的label
    reminderLabel =  new QLabel(this);
    reminderLabel  ->setGeometry(QRect(QPoint(500, 40), QSize(150, 100)));
     reminderLabel ->setText("粉色食物：HP值+1\n橙色食物：身体长度+1 \n黄色食物：速度+1 \nQ键退出\nP键暂停\nN键开始新游戏 ");

    // Connect button signal to appropriate slot
    connect(oneModeButton, &QPushButton::released, this, &MainWindow::handleButtonOne);
    connect(twoModeButton, &QPushButton::released, this, &MainWindow::handleButtonTwo);
    connect( autoPlayButton, &QPushButton::released, this, &MainWindow::handleButtonAuto);
    connect( continuePlayButton, &QPushButton::released, this, &MainWindow::handleContinuePlayButton);
    connect( editMapButton, &QPushButton::released, this, &MainWindow::handleEditMapButton);

    changeHpLabelText();
    createActions();
    createMenus();
    initScene();
    initSceneBackground();
    scene->addRect(QRect(-95,-95,5,190),QPen(QColor(137,201,151)),QBrush(QColor(137,201,151)));
     scene->addRect(QRect(95,-95,5,190),QPen(QColor(137,201,151)),QBrush(QColor(137,201,151)));
    scene ->addRect(Rdown,QPen(QColor(137,201,151)),QBrush(QColor(137,201,151)));
    changeWall();
    QTimer::singleShot(0, this, SLOT(adjustViewSize()));
}

MainWindow::~MainWindow()
{
    if(sna)delete sna;
    if(aiSnake)delete aiSnake;
    delete ui;
}
void MainWindow::changeHpLabelText(){
    //改变HPlabel的值
    QString hp="HP1:  "+QString(QString::number(game->snake->HP));
    if(game->snake2!=nullptr){
        hp+="\nHP2:  "+QString(QString::number(game->snake2->HP));
    }
    hpLabel->setStyleSheet(" color : black; font-size:25px;");
    hpLabel->setText(hp);
    hpLabel->resize(100,80);
}
//set the visibility of the button of the menu
void MainWindow:: setvis(bool s){
    oneModeButton->setVisible(s);
    twoModeButton->setVisible(s);
    autoPlayButton->setVisible(s);
    continuePlayButton->setVisible(s);
    editMapButton ->setVisible(s);
}

void MainWindow::handleButtonOne()
{
    setvis();
    game->begin=1;
}

void MainWindow::handleButtonTwo()
{
    setvis();
    game->begin=1;
    game->addSnake();
    changeHpLabelText();
}

void MainWindow::handleButtonAuto(){
    setvis();
    sna= new DrawSnake();
    aiSnake = new AiSnake;
    setCentralWidget(sna);
    aiSnake->start();
    connect(this->aiSnake, SIGNAL(update()), this, SLOT(updateSnakeAndFood()));
}

void MainWindow::handleContinuePlayButton(){
    ifstream infile; int length1=0;int length2=0;int num=0;
    string x;string y; int foodFype=0; double fx=0; double fy=0;int hp1=0;int hp2=0;
    setvis();
    scene->addRect(QRect(-5,-5,10,10),QPen(QColor(193,221,234)),QBrush(QColor(193,221,234)));
    game->begin=1;
    infile.open("state.txt");
    infile >> num>>length1 >>length2;
    //清空原有的tail
    while (!game->snake->tail.empty()) {
            game->snake->tail.pop_back();
        }
        //放入保存的数据
        for(int i=0;i<length1;i++){
            infile >> x >> y;
            if(i==length1-1){
                game->snake->head.rx()=stoi(x);
                game->snake->head.ry()=stoi(y);
            }
            QPoint tmp(stoi(x),stoi(y));
            game->snake->tail<<tmp;
        }
        game->snake->growing=0;
 //如果有两条蛇
    if(num==2){
        game->snake2 =  new Snake(*game,2,1);
        game->snake2->other =game->snake;
        game->snake ->other =game->snake2;
        while (!game->snake2->tail.empty()) {
            game->snake2->tail.pop_back();
        }
        for(int i=0;i<length2;i++){
            infile >> x >> y;
           cout<<x<<y<<endl;
            if(i==length2-1){
                game->snake2->head.rx()=stoi(x);
                game->snake2->head.ry()=stoi(y);
            }
            QPoint tmp(stoi(x),stoi(y));
            game->snake2->tail<<tmp;
        }
         game->snake2->growing=0;
         //scene->addItem(game->snake2);
    }
//读档食物
   game->foodList.clear();
   for(int i=0;i<3;i++){
       infile >> foodFype >> fx>>fy;
       Food *f =new Food(fx, fy, foodFype);
       game->foodList.append(f);
   }
   //读档hp值
   infile >> hp1 >> hp2;
   game->snake->HP=hp1;
   if(num==2)game->snake2->HP=hp2;
   infile.close();
}

void MainWindow::handleEditCompletedButton(){

    int fx[3]={0};
    int fy[3]={0};
    int wx[3]={0};
    int wy[3]={0};
    bool  flag=0;
    for(int i=0;i<3;i++){
        QString content = fPos[i]->text();
        QStringList list1 = content.split(' ');
        fx[i] = list1[0].toInt();
        fy[i]= list1[0].toInt();
    }
        for(int i=0;i<3;i++){
        if(fx[i]<-100 || fx[i]>100)flag=1;//违法输入
        if(fy[i]<-100 || fy[i]>100)flag=1;//违法输入
}
       if(flag==0)game->changeFoodPos(fx,fy);
}


void MainWindow::handleEditMapButton(){
    setvis();
    for(int i=0;i<3;i++){
        QString f("food ");
        fPos[i]= new QLineEdit(this);
        QString i1=QString::number(i+1);
        f = f+i1;
        fPos[i]->setPlaceholderText(f);//占位符
        fPos[i]->setGeometry(QRect(QPoint(480,100+50*i ), QSize(90, 30)));
        fPos[i]->setVisible(true);
    }
    editWallButton= new QPushButton(" Edit Wall", this);
    editWallButton ->setGeometry(QRect(QPoint(480, 350), QSize(90, 30)));
    editWallButton->setVisible(true);

    editCompletedButton= new QPushButton("save", this);
    editCompletedButton->setGeometry(QRect(QPoint(480, 400), QSize(90, 30)));
    editCompletedButton ->setVisible(true);
    runButton = new QPushButton("run", this);
    runButton->setGeometry(QRect(QPoint(480, 450), QSize(90, 30)));
    runButton->setVisible(true);
    hpLabel->setVisible(false);

    inputLabel = new QLabel( this ); //提示输入格式的label
    inputLabel ->setGeometry(QRect(QPoint(40, 10), QSize(190, 120)));
    inputLabel -> setStyleSheet("color:black");
    inputLabel->setText("请输入x,y坐标,\n以空格作为分隔\n默认为0, x,y范围为（-70,70)");
    inputLabel ->setVisible(true);

    connect( editCompletedButton, &QPushButton::released, this, &MainWindow::handleEditCompletedButton);
    connect( runButton, &QPushButton::released, this, &MainWindow::handleRunButton);
    connect( editWallButton, &QPushButton::released, this, &MainWindow::changeWall);

}
void MainWindow::handleRunButton(){
    for(int i=0;i<3;i++)fPos[i]->setVisible(false);
    editCompletedButton->setVisible(false);
    inputLabel ->setVisible(false);
    runButton->setVisible(false);
    inputLabel->setVisible(false);
    editWallButton ->setVisible(false);
    hpLabel->setVisible(true);
    if(game->begin==0)setvis(true);
    else resumeAction;
}

void MainWindow::adjustViewSize()
{
   view->fitInView(scene->sceneRect(), Qt::KeepAspectRatioByExpanding);
}

void MainWindow::createActions()
{
    //快捷键处理
    newGameAction = new QAction(tr("&New Game"), this);
    newGameAction->setShortcut(tr("N"));
    newGameAction->setStatusTip(tr("Start a new game"));
    connect(newGameAction, &QAction::triggered, this, &MainWindow::newGame);

    exitAction = new QAction(tr("&Exit"), this);
    exitAction->setShortcut(tr("Q"));
    exitAction->setStatusTip(tr("Exit the game"));
    connect(exitAction, &QAction::triggered, game, &GameController::pause);
    connect(exitAction, &QAction::triggered, this, &MainWindow::close);

    pauseAction = new QAction(tr("&Pause"), this);
    pauseAction->setShortcut(tr("P"));
    pauseAction->setStatusTip(tr("Pause..."));
    connect(pauseAction, &QAction::triggered, game, &GameController::pause);
    connect(pauseAction, &QAction::triggered, this, &MainWindow::handleEditMapButton);

    resumeAction = new QAction(tr("&Resume"), this);
    resumeAction->setShortcut(tr("R"));
    resumeAction->setStatusTip(tr("Resume..."));
    resumeAction->setEnabled(false);
    game->setResumeAction(resumeAction);
    connect(resumeAction, &QAction::triggered, game, &GameController::resume);
    connect(resumeAction, &QAction::triggered, this, &MainWindow::handleRunButton);  
    gameHelpAction = new QAction(tr("Game &Help"), this);
    gameHelpAction->setShortcut(tr("H"));
    gameHelpAction->setStatusTip(tr("Help on this game"));
    connect(gameHelpAction, &QAction::triggered, this, &MainWindow::gameHelp);

    aboutAction = new QAction(tr("&About"), this);
    aboutAction->setShortcut(tr("I"));
    aboutAction->setStatusTip(tr("Show the application's about box"));
    connect(aboutAction, &QAction::triggered, this, &MainWindow::about);

    aboutQtAction = new QAction(tr("About &Qt"), this);
    aboutQtAction->setStatusTip(tr("Show the Qt library's About box"));
    connect(aboutQtAction, &QAction::triggered, qApp, QApplication::aboutQt);
}

void MainWindow::createMenus()
{
    QMenu *options = menuBar()->addMenu(tr("&Options"));
    options->addAction(newGameAction);
    options->addSeparator();
    options->addAction(pauseAction);
    options->addAction(resumeAction);
    options->addSeparator();
    options->addAction(exitAction);

    QMenu *help = menuBar()->addMenu(tr("&Help"));
    help->addAction(gameHelpAction);
    help->addAction(aboutAction);
    help->addAction(aboutQtAction);
}

void MainWindow::initScene()
{
    scene->setSceneRect(-100, -100, 200, 200);
}
void MainWindow::changeWall(){
    //墙体编辑
    if(wallAround==0){
        scene->addRect(QRect(-95,-95,195,5),QPen(QColor(137,201,151)),QBrush(QColor(137,201,151)));
        scene ->addRect(QRect(-95,95,195,5),QPen(QColor(137,201,151)),QBrush(QColor(137,201,151)));
        wallAround =1;
    }
    else{
        scene->addRect(QRect(-95,-95,195,5),QPen(QColor(193,221,234)),QBrush(QColor(193,221,234)));
        scene ->addRect(QRect(-95,95,195,5),QPen(QColor(193,221,234)),QBrush(QColor(193,221,234)));
        wallAround =0;
    }
}


void MainWindow::initSceneBackground()
{
    //初始化背景
    //Constructs a pixmap with the given width and height.
    QBrush b = QBrush(QColor(193,221,234));
    view->setBackgroundBrush(b);
    setAutoFillBackground(true);
}

void MainWindow::updateSnakeAndFood()
{
    GridLocation food = aiSnake->getFoodPosition();
    deque<GridLocation> deq = aiSnake->getSnakePosition();
    sna->updateSnakeAndFood(food, deq);
    sna->repaint();
}

void MainWindow::newGame()
{

    QTimer::singleShot(0, game, SLOT(gameOver()));
}

void MainWindow::about()
{
    QMessageBox::about(this, tr("About this Game"), tr("<h2>Snake Game</h2>"
                                                       "<p>Copyright Yixiao Kang."));
}

void MainWindow::gameHelp()
{
    QMessageBox::about(this, tr("Game Help"), tr("Using direction keys to control the snake to eat the food"
                                                 "<p>Space - pause & resume"));
}
