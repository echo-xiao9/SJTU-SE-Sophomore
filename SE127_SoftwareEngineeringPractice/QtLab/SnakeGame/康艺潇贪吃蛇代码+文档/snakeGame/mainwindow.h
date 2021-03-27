#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>
#include <QLabel>
#include <QLineEdit>
#include <QHBoxLayout>
#include <qaction.h>
#include <qmenubar.h>
#include <qapplication.h>
#include <QIcon>
#include <QGraphicsView>
#include <QTimer>
#include <QPushButton>
#include<QVBoxLayout>
#include <QRadioButton>
#include <QColorDialog>
#include<QDebug>
#include <QMessageBox>
#include "drawsnake.h"
#include "aiSnake.h"
#include "public.h"
#include "food.h"
#include "gamecontroller.h"
#include "ui_MainWindow.h"
#include "snake.h"
#include <fstream>
#include <iostream>
#include <string>


class QGraphicsScene;
class QGraphicsView;
class MainWindow2;
class GameController;
class MyWindow;
class DrawSnake;
QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT
public:
    MainWindow(MyWindow*w,QWidget *parent = 0);
    ~MainWindow();
    void changeHpLabelText();
    QGraphicsScene *scene;
     bool wallAround;
    void setvis(bool s=false);  //设置button是否可见
private slots:
    void updateSnakeAndFood();
    void adjustViewSize();
	void newGame();
	void gameHelp();
	void about();
    void handleButtonOne();
    void handleButtonTwo();
    void handleButtonAuto();
   // void handleRetrunButton();
    void handleContinuePlayButton();
    void handleEditCompletedButton();
    void handleEditMapButton();
    void handleRunButton();

    void changeWall();

   // QLine l1;

private:

	void createActions();
	void createMenus();
    void initScene();
    void initSceneBackground();
    QGraphicsView *view;
    GameController *game;
    MyWindow *win;

	QAction *newGameAction;
	QAction *pauseAction;
	QAction *resumeAction;
    QAction *saveAction;
	QAction *exitAction;
	QAction *gameHelpAction;
	QAction *aboutAction;
	QAction *aboutQtAction;
    QAction *changeWallAction;

    QPushButton * oneModeButton;
    QPushButton * twoModeButton;
    QPushButton * autoPlayButton;
    QPushButton * continuePlayButton;
    QPushButton * editMapButton;
    QPushButton * editCompletedButton;
    QPushButton * runButton;
    QPushButton * editWallButton;
    QLabel *hpLabel;
    QLabel *inputLabel;
    QLabel *reminderLabel;
    QHBoxLayout *layout;
    QLineEdit *fPos[3];

    QLineEdit *f1Pos;
    QLineEdit *f2Pos;
    QLineEdit *f3Pos;
    QLineEdit *w1Pos;
    QLineEdit *w2Pos;
    QLineEdit *w3Pos;
    DrawSnake *sna;
    AiSnake *aiSnake;
    Ui::MainWindow *ui;

    QRect Rup;
    QRect Rdown;
};

#endif // MAINWINDOW_H
