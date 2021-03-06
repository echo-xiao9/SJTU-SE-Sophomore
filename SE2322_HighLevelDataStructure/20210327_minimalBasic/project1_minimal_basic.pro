QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    DebugEnd.cpp \
    DebugError.cpp \
    Exp.cpp \
    Help.cpp \
    Statement.cpp \
    main.cpp \
    MainWindow.cpp

HEADERS += \
    DebugEnd.h \
    DebugError.h \
    Exp.h \
    Help.h \
    MainWindow.h \
    Statement.h

FORMS += \
    DebugEnd.ui \
    DebugError.ui \
    Help.ui \
    MainWindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    baTest.txt \
    command.txt \
    command的副本.txt \
    fibo.txt \
    quoteTest.txt
