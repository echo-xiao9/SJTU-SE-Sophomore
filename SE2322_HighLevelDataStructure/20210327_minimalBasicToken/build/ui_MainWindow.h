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
    QHBoxLayout *horizontalLayout_2;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout_3;
    QVBoxLayout *verticalLayout_2;
    QLabel *label_3;
    QTextBrowser *codeBrowser;
    QVBoxLayout *verticalLayout_3;
    QLabel *label_4;
    QTextBrowser *resultBrowser;
    QLabel *label_2;
    QTextBrowser *syntaxDisplayBroser;
    QHBoxLayout *horizontalLayout;
    QPushButton *clearButton;
    QPushButton *runButton;
    QPushButton *loadButton;
    QLabel *label;
    QLineEdit *codeLineEdit;
    QMenuBar *menubar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(800, 600);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        horizontalLayout_2 = new QHBoxLayout(centralwidget);
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QString::fromUtf8("horizontalLayout_3"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        label_3 = new QLabel(centralwidget);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        verticalLayout_2->addWidget(label_3);

        codeBrowser = new QTextBrowser(centralwidget);
        codeBrowser->setObjectName(QString::fromUtf8("codeBrowser"));

        verticalLayout_2->addWidget(codeBrowser);


        horizontalLayout_3->addLayout(verticalLayout_2);

        verticalLayout_3 = new QVBoxLayout();
        verticalLayout_3->setObjectName(QString::fromUtf8("verticalLayout_3"));
        label_4 = new QLabel(centralwidget);
        label_4->setObjectName(QString::fromUtf8("label_4"));

        verticalLayout_3->addWidget(label_4);

        resultBrowser = new QTextBrowser(centralwidget);
        resultBrowser->setObjectName(QString::fromUtf8("resultBrowser"));

        verticalLayout_3->addWidget(resultBrowser);


        horizontalLayout_3->addLayout(verticalLayout_3);


        verticalLayout->addLayout(horizontalLayout_3);

        label_2 = new QLabel(centralwidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        verticalLayout->addWidget(label_2);

        syntaxDisplayBroser = new QTextBrowser(centralwidget);
        syntaxDisplayBroser->setObjectName(QString::fromUtf8("syntaxDisplayBroser"));

        verticalLayout->addWidget(syntaxDisplayBroser);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        clearButton = new QPushButton(centralwidget);
        clearButton->setObjectName(QString::fromUtf8("clearButton"));

        horizontalLayout->addWidget(clearButton);

        runButton = new QPushButton(centralwidget);
        runButton->setObjectName(QString::fromUtf8("runButton"));

        horizontalLayout->addWidget(runButton);

        loadButton = new QPushButton(centralwidget);
        loadButton->setObjectName(QString::fromUtf8("loadButton"));

        horizontalLayout->addWidget(loadButton);


        verticalLayout->addLayout(horizontalLayout);

        label = new QLabel(centralwidget);
        label->setObjectName(QString::fromUtf8("label"));

        verticalLayout->addWidget(label);

        codeLineEdit = new QLineEdit(centralwidget);
        codeLineEdit->setObjectName(QString::fromUtf8("codeLineEdit"));

        verticalLayout->addWidget(codeLineEdit);


        horizontalLayout_2->addLayout(verticalLayout);

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
        label_3->setText(QApplication::translate("MainWindow", "\344\273\243\347\240\201", nullptr));
        label_4->setText(QApplication::translate("MainWindow", "\350\277\220\350\241\214\347\273\223\346\236\234", nullptr));
        label_2->setText(QApplication::translate("MainWindow", "\350\257\255\345\217\245\345\222\214\350\257\255\346\263\225\346\240\221", nullptr));
        clearButton->setText(QApplication::translate("MainWindow", "\346\270\205\347\251\272\344\273\243\347\240\201 (CLEAR)", nullptr));
        runButton->setText(QApplication::translate("MainWindow", "\346\211\247\350\241\214\344\273\243\347\240\201 (RUN)", nullptr));
        loadButton->setText(QApplication::translate("MainWindow", "\350\275\275\345\205\245\344\273\243\347\240\201 (LOAD)", nullptr));
        label->setText(QApplication::translate("MainWindow", "\345\221\275\344\273\244\350\276\223\345\205\245\347\252\227\345\217\243", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
