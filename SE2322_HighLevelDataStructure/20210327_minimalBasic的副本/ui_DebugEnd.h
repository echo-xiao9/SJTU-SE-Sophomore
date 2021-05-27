/********************************************************************************
** Form generated from reading UI file 'DebugEnd.ui'
**
** Created by: Qt User Interface Compiler version 5.12.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DEBUGEND_H
#define UI_DEBUGEND_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_DebugEnd
{
public:
    QWidget *centralwidget;
    QLabel *label;
    QMenuBar *menubar;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *DebugEnd)
    {
        if (DebugEnd->objectName().isEmpty())
            DebugEnd->setObjectName(QString::fromUtf8("DebugEnd"));
        DebugEnd->resize(400, 200);
        centralwidget = new QWidget(DebugEnd);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        label = new QLabel(centralwidget);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(120, 30, 221, 91));
        DebugEnd->setCentralWidget(centralwidget);
        menubar = new QMenuBar(DebugEnd);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 400, 22));
        DebugEnd->setMenuBar(menubar);
        statusbar = new QStatusBar(DebugEnd);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        DebugEnd->setStatusBar(statusbar);

        retranslateUi(DebugEnd);

        QMetaObject::connectSlotsByName(DebugEnd);
    } // setupUi

    void retranslateUi(QMainWindow *DebugEnd)
    {
        DebugEnd->setWindowTitle(QApplication::translate("DebugEnd", "MainWindow", nullptr));
        label->setText(QApplication::translate("DebugEnd", "\350\242\253\350\260\203\350\257\225\347\232\204\347\250\213\345\272\217\346\255\243\345\270\270\347\273\223\346\235\237", nullptr));
    } // retranslateUi

};

namespace Ui {
    class DebugEnd: public Ui_DebugEnd {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DEBUGEND_H
