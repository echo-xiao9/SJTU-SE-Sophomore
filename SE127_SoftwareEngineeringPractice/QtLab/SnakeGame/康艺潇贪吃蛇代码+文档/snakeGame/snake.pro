#-------------------------------------------------
#
# Project created by QtCreator 2012-12-11T19:56:10
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = snake
TEMPLATE = app


SOURCES += main.cpp\
    aiSnake.cpp \
    drawsnake.cpp \
    implementation.cpp \
        mainwindow.cpp \
    food.cpp \
    gamecontroller.cpp \
    snake.cpp \
    window.cpp

HEADERS  += mainwindow.h \
    aiSnake.h \
    drawsnake.h \
    food.h \
    gamecontroller.h \
    implementation.h \
    public.h \
    snake.h \
    window.h

RESOURCES += \
    res.qrc

FORMS += \
    MainWindow.ui

DISTFILES += \
    state.txt


