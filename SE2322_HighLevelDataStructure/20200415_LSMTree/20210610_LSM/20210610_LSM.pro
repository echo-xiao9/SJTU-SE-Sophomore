TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        correctness.cc \
        correctness2.cc \
        kvstore.cc \
        main.cpp \
        myTest.cpp \
        persistence.cc \
        skipList.cpp \
        ssTable.cc

DISTFILES += \
    Makefile \
    README.md \
    testMB

HEADERS += \
    MurmurHash3.h \
    const.h \
    kvstore.h \
    kvstore_api.h \
    skipList.h \
    ssTable.h \
    test.h \
    utils.h
