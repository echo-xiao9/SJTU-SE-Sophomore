#ifndef DEBUGERROR_H
#define DEBUGERROR_H

#include <QMainWindow>

namespace Ui {
class DebugError;
}

class DebugError : public QMainWindow
{
    Q_OBJECT

public:
    explicit DebugError(QWidget *parent = nullptr);
    ~DebugError();

private:
    Ui::DebugError *ui;
};

#endif // DEBUGERROR_H
