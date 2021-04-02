/****************************************************************************
** Meta object code from reading C++ file 'MainWindow.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "MainWindow.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'MainWindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_MainWindow_t {
    QByteArrayData data[28];
    char stringdata0[241];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MainWindow_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MainWindow_t qt_meta_stringdata_MainWindow = {
    {
QT_MOC_LITERAL(0, 0, 10), // "MainWindow"
QT_MOC_LITERAL(1, 11, 22), // "on_codeLineEdit_return"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 22), // "on_clearButton_clicked"
QT_MOC_LITERAL(4, 58, 10), // "parse_line"
QT_MOC_LITERAL(5, 69, 7), // "parse_t"
QT_MOC_LITERAL(6, 77, 8), // "QString&"
QT_MOC_LITERAL(7, 86, 4), // "line"
QT_MOC_LITERAL(8, 91, 10), // "parse_stmt"
QT_MOC_LITERAL(9, 102, 3), // "ptr"
QT_MOC_LITERAL(10, 106, 7), // "stmt_t&"
QT_MOC_LITERAL(11, 114, 4), // "stmt"
QT_MOC_LITERAL(12, 119, 9), // "parse_cmd"
QT_MOC_LITERAL(13, 129, 3), // "cmd"
QT_MOC_LITERAL(14, 133, 9), // "parse_num"
QT_MOC_LITERAL(15, 143, 4), // "int&"
QT_MOC_LITERAL(16, 148, 3), // "val"
QT_MOC_LITERAL(17, 152, 9), // "parse_var"
QT_MOC_LITERAL(18, 162, 4), // "name"
QT_MOC_LITERAL(19, 167, 9), // "parse_exp"
QT_MOC_LITERAL(20, 177, 3), // "exp"
QT_MOC_LITERAL(21, 181, 11), // "parse_delim"
QT_MOC_LITERAL(22, 193, 5), // "delim"
QT_MOC_LITERAL(23, 199, 10), // "find_instr"
QT_MOC_LITERAL(24, 210, 7), // "stmt_t*"
QT_MOC_LITERAL(25, 218, 11), // "judge_infix"
QT_MOC_LITERAL(26, 230, 6), // "string"
QT_MOC_LITERAL(27, 237, 3) // "str"

    },
    "MainWindow\0on_codeLineEdit_return\0\0"
    "on_clearButton_clicked\0parse_line\0"
    "parse_t\0QString&\0line\0parse_stmt\0ptr\0"
    "stmt_t&\0stmt\0parse_cmd\0cmd\0parse_num\0"
    "int&\0val\0parse_var\0name\0parse_exp\0exp\0"
    "parse_delim\0delim\0find_instr\0stmt_t*\0"
    "judge_infix\0string\0str"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MainWindow[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   69,    2, 0x08 /* Private */,
       3,    0,   70,    2, 0x08 /* Private */,
       4,    1,   71,    2, 0x08 /* Private */,
       8,    2,   74,    2, 0x08 /* Private */,
      12,    2,   79,    2, 0x08 /* Private */,
      14,    2,   84,    2, 0x08 /* Private */,
      17,    2,   89,    2, 0x08 /* Private */,
      19,    2,   94,    2, 0x08 /* Private */,
      21,    2,   99,    2, 0x08 /* Private */,
      23,    1,  104,    2, 0x08 /* Private */,
      25,    1,  107,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    0x80000000 | 5, 0x80000000 | 6,    7,
    0x80000000 | 5, 0x80000000 | 6, 0x80000000 | 10,    9,   11,
    0x80000000 | 5, 0x80000000 | 6, 0x80000000 | 10,    9,   13,
    0x80000000 | 5, 0x80000000 | 6, 0x80000000 | 15,    9,   16,
    0x80000000 | 5, 0x80000000 | 6, 0x80000000 | 6,    9,   18,
    0x80000000 | 5, 0x80000000 | 6, 0x80000000 | 6,    9,   20,
    0x80000000 | 5, 0x80000000 | 6, 0x80000000 | 6,    9,   22,
    0x80000000 | 24, QMetaType::QString,   18,
    QMetaType::Bool, 0x80000000 | 26,   27,

       0        // eod
};

void MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<MainWindow *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->on_codeLineEdit_return(); break;
        case 1: _t->on_clearButton_clicked(); break;
        case 2: { parse_t _r = _t->parse_line((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< parse_t*>(_a[0]) = std::move(_r); }  break;
        case 3: { parse_t _r = _t->parse_stmt((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< stmt_t(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< parse_t*>(_a[0]) = std::move(_r); }  break;
        case 4: { parse_t _r = _t->parse_cmd((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< stmt_t(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< parse_t*>(_a[0]) = std::move(_r); }  break;
        case 5: { parse_t _r = _t->parse_num((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< parse_t*>(_a[0]) = std::move(_r); }  break;
        case 6: { parse_t _r = _t->parse_var((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< parse_t*>(_a[0]) = std::move(_r); }  break;
        case 7: { parse_t _r = _t->parse_exp((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< parse_t*>(_a[0]) = std::move(_r); }  break;
        case 8: { parse_t _r = _t->parse_delim((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< parse_t*>(_a[0]) = std::move(_r); }  break;
        case 9: { stmt_t* _r = _t->find_instr((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< stmt_t**>(_a[0]) = std::move(_r); }  break;
        case 10: { bool _r = _t->judge_infix((*reinterpret_cast< string(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject MainWindow::staticMetaObject = { {
    &QMainWindow::staticMetaObject,
    qt_meta_stringdata_MainWindow.data,
    qt_meta_data_MainWindow,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_MainWindow.stringdata0))
        return static_cast<void*>(this);
    return QMainWindow::qt_metacast(_clname);
}

int MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 11;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
