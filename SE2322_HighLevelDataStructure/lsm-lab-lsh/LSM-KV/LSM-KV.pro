QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    BloomFilter.cc \
    Filter.cc \
    SSTable.cc \
    SkipList.cc \
    correctness.cc \
    kvstore.cc \
    main.cpp \
    persistence.cc

HEADERS += \
    BloomFilter.h \
    Filter.h \
    MurmurHash3.h \
    SSTable.h \
    SkipList.h \
    const.h \
    kvstore.h \
    kvstore_api.h \
    structs.h \
    test.h \
    utils.h

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    ../README.md \
    LSM-KV.pro.user \
    LSM-KV.pro.user.47ae5ba \
    Makefile \
    README.md
