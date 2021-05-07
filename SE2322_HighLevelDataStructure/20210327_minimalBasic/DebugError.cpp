#include "DebugError.h"
#include "ui_DebugError.h"

DebugError::DebugError(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::DebugError)
{
    ui->setupUi(this);
}

DebugError::~DebugError()
{
    delete ui;
}
