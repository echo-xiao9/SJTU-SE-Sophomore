TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        boggle.cpp \
        lexicon.cpp

DISTFILES += \
    EnglishWords.txt

HEADERS += \
    lexicon.h
