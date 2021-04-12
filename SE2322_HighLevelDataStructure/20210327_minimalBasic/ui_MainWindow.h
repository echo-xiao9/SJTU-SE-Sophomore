/********************************************************************************
** Form generated from reading UI file 'MainWindow.ui'
**
** Created by: Qt User Interface Compiler version 5.12.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextBrowser>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QVBoxLayout *verticalLayout_5;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout_3;
    QVBoxLayout *verticalLayout_2;
    QLabel *codeLabel;
    QTextBrowser *codeBrowser;
    QVBoxLayout *verticalLayout_3;
    QLabel *resultLable;
    QTextBrowser *resultBrowser;
    QVBoxLayout *verticalLayout_4;
    QLabel *varLabel;
    QTextBrowser *varBrowser;
    QLabel *syntaxLabel;
    QTextBrowser *syntaxDisplayBroser;
    QHBoxLayout *horizontalLayout;
    QPushButton *clearButton;
    QPushButton *runButton;
    QPushButton *loadButton;
    QLabel *inputlabel;
    QLineEdit *codeLineEdit;
    QLabel *messageLabel;
    QLineEdit *messageLineEdit;
    QMenuBar *menubar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(800, 600);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        centralwidget->setStyleSheet(QString::fromUtf8("centralwidget\n"
"{\n"
"	background:#333\n"
"}"));
        verticalLayout_5 = new QVBoxLayout(centralwidget);
        verticalLayout_5->setObjectName(QString::fromUtf8("verticalLayout_5"));
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QString::fromUtf8("horizontalLayout_3"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        codeLabel = new QLabel(centralwidget);
        codeLabel->setObjectName(QString::fromUtf8("codeLabel"));

        verticalLayout_2->addWidget(codeLabel);

        codeBrowser = new QTextBrowser(centralwidget);
        codeBrowser->setObjectName(QString::fromUtf8("codeBrowser"));
        codeBrowser->setStyleSheet(QString::fromUtf8("codeBrower{\n"
"qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(0, 0, 0, 255), stop:1 rgba(255, 255, 255, 255))\n"
"}"));

        verticalLayout_2->addWidget(codeBrowser);


        horizontalLayout_3->addLayout(verticalLayout_2);

        verticalLayout_3 = new QVBoxLayout();
        verticalLayout_3->setObjectName(QString::fromUtf8("verticalLayout_3"));
        resultLable = new QLabel(centralwidget);
        resultLable->setObjectName(QString::fromUtf8("resultLable"));

        verticalLayout_3->addWidget(resultLable);

        resultBrowser = new QTextBrowser(centralwidget);
        resultBrowser->setObjectName(QString::fromUtf8("resultBrowser"));

        verticalLayout_3->addWidget(resultBrowser);


        horizontalLayout_3->addLayout(verticalLayout_3);

        verticalLayout_4 = new QVBoxLayout();
        verticalLayout_4->setObjectName(QString::fromUtf8("verticalLayout_4"));
        varLabel = new QLabel(centralwidget);
        varLabel->setObjectName(QString::fromUtf8("varLabel"));

        verticalLayout_4->addWidget(varLabel);

        varBrowser = new QTextBrowser(centralwidget);
        varBrowser->setObjectName(QString::fromUtf8("varBrowser"));

        verticalLayout_4->addWidget(varBrowser);


        horizontalLayout_3->addLayout(verticalLayout_4);

        horizontalLayout_3->setStretch(0, 2);
        horizontalLayout_3->setStretch(1, 2);
        horizontalLayout_3->setStretch(2, 1);

        verticalLayout->addLayout(horizontalLayout_3);

        syntaxLabel = new QLabel(centralwidget);
        syntaxLabel->setObjectName(QString::fromUtf8("syntaxLabel"));

        verticalLayout->addWidget(syntaxLabel);

        syntaxDisplayBroser = new QTextBrowser(centralwidget);
        syntaxDisplayBroser->setObjectName(QString::fromUtf8("syntaxDisplayBroser"));
        QFont font;
        font.setFamily(QString::fromUtf8("Arial"));
        syntaxDisplayBroser->setFont(font);

        verticalLayout->addWidget(syntaxDisplayBroser);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        clearButton = new QPushButton(centralwidget);
        clearButton->setObjectName(QString::fromUtf8("clearButton"));
        clearButton->setMouseTracking(false);
        clearButton->setStyleSheet(QString::fromUtf8("QPushButton{\n"
"rgb(255, 49, 8)\n"
"}"));

        horizontalLayout->addWidget(clearButton);

        runButton = new QPushButton(centralwidget);
        runButton->setObjectName(QString::fromUtf8("runButton"));

        horizontalLayout->addWidget(runButton);

        loadButton = new QPushButton(centralwidget);
        loadButton->setObjectName(QString::fromUtf8("loadButton"));
        loadButton->setMouseTracking(true);

        horizontalLayout->addWidget(loadButton);


        verticalLayout->addLayout(horizontalLayout);

        inputlabel = new QLabel(centralwidget);
        inputlabel->setObjectName(QString::fromUtf8("inputlabel"));

        verticalLayout->addWidget(inputlabel);

        codeLineEdit = new QLineEdit(centralwidget);
        codeLineEdit->setObjectName(QString::fromUtf8("codeLineEdit"));

        verticalLayout->addWidget(codeLineEdit);

        messageLabel = new QLabel(centralwidget);
        messageLabel->setObjectName(QString::fromUtf8("messageLabel"));

        verticalLayout->addWidget(messageLabel);

        messageLineEdit = new QLineEdit(centralwidget);
        messageLineEdit->setObjectName(QString::fromUtf8("messageLineEdit"));

        verticalLayout->addWidget(messageLineEdit);


        verticalLayout_5->addLayout(verticalLayout);

        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 800, 22));
        MainWindow->setMenuBar(menubar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", nullptr));
        codeLabel->setText(QApplication::translate("MainWindow", "\344\273\243\347\240\201", nullptr));
        resultLable->setText(QApplication::translate("MainWindow", "\350\277\220\350\241\214\347\273\223\346\236\234", nullptr));
        varLabel->setText(QApplication::translate("MainWindow", "\345\217\230\351\207\217\344\277\241\346\201\257", nullptr));
        syntaxLabel->setText(QApplication::translate("MainWindow", "\345\217\245\346\263\225\344\270\216\350\257\255\346\263\225\346\240\221", nullptr));
        clearButton->setText(QApplication::translate("MainWindow", "\346\270\205\347\251\272\344\273\243\347\240\201 (CLEAR)", nullptr));
        runButton->setText(QApplication::translate("MainWindow", "\346\211\247\350\241\214\344\273\243\347\240\201 (RUN)", nullptr));
        loadButton->setText(QApplication::translate("MainWindow", "\350\275\275\345\205\245\344\273\243\347\240\201 (LOAD)", nullptr));
        inputlabel->setText(QApplication::translate("MainWindow", "\345\221\275\344\273\244\350\276\223\345\205\245\347\252\227\345\217\243", nullptr));
        messageLabel->setText(QApplication::translate("MainWindow", "\346\217\220\347\244\272\344\277\241\346\201\257", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
