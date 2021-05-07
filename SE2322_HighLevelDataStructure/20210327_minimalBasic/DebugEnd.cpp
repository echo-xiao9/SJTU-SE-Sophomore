#include "DebugEnd.h"
#include "ui_DebugEnd.h"

DebugEnd::DebugEnd(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::DebugEnd)
{
    ui->setupUi(this);
}

DebugEnd::~DebugEnd()
{
    delete ui;
}
