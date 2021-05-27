#ifndef DEBUGEND_H
#define DEBUGEND_H

#include <QMainWindow>

namespace Ui {
class DebugEnd;
}

class DebugEnd : public QMainWindow
{
    Q_OBJECT

public:
    explicit DebugEnd(QWidget *parent = nullptr);
    ~DebugEnd();
private:
    Ui::DebugEnd *ui;
};

#endif // DEBUGEND_H
