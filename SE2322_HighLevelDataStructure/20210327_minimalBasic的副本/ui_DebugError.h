/********************************************************************************
** Form generated from reading UI file 'DebugError.ui'
**
** Created by: Qt User Interface Compiler version 5.12.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DEBUGERROR_H
#define UI_DEBUGERROR_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_DebugError
{
public:
    QWidget *centralwidget;
    QLabel *label;
    QMenuBar *menubar;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *DebugError)
    {
        if (DebugError->objectName().isEmpty())
            DebugError->setObjectName(QString::fromUtf8("DebugError"));
        DebugError->resize(400, 200);
        centralwidget = new QWidget(DebugError);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        label = new QLabel(centralwidget);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(150, 20, 221, 91));
        DebugError->setCentralWidget(centralwidget);
        menubar = new QMenuBar(DebugError);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 400, 22));
        DebugError->setMenuBar(menubar);
        statusbar = new QStatusBar(DebugError);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        DebugError->setStatusBar(statusbar);

        retranslateUi(DebugError);

        QMetaObject::connectSlotsByName(DebugError);
    } // setupUi

    void retranslateUi(QMainWindow *DebugError)
    {
        DebugError->setWindowTitle(QApplication::translate("DebugError", "MainWindow", nullptr));
        label->setText(QApplication::translate("DebugError", "\350\257\245\350\257\255\345\217\245\346\234\211\351\224\231\350\257\257", nullptr));
    } // retranslateUi

};

namespace Ui {
    class DebugError: public Ui_DebugError {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DEBUGERROR_H
