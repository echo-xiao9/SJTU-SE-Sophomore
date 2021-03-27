#ifndef STUDENT_H_
#define STUDENT_H_
#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Class;

enum Degree {
    undergraduate,
    graduate
};


class Student {
    // TODO: implement class Student.
private:
    string name;
    string year;
    Degree degree;

protected:
    vector<Class*>classes;

public:
    const std::string id;
    virtual double getGrade() = 0;
    std::string toString() const;
    void addClass(Class*c);
    Student(string Id,string Name,string Year,Degree degree1 ):id(Id),name(Name),year(Year),degree (degree1){}


};

class Undergraduate:public Student{
public:
    Undergraduate(string Id,string Name,string Year,Degree degree1=undergraduate) : Student(Id,Name,Year,degree1){}
    double getGrade();

};

class Graduate:public Student{
public:
    Graduate(string Id,string Name,string Year, Degree degree1=graduate) : Student(Id,Name,Year, degree1){}
    double getGrade();
};

// TODO: implement class Graduate.

// TODO: implement class Undergraduate.

class StudentWrapper {
private:
    const Student &student;
    double score = 0.0;

public:
    const std::string id;
    // TODO: fix error
    StudentWrapper(const std::string &id, const Student &student):id(id),student(student) {}

    void setScore(double score)
    {
        if (score < 0 || score > 100)
            throw "Invalid Score!";
        this->score = score;
    }

    double getScore() const
    {
        return this->score;
    }

    std::string toString() const
    {
        return student.toString();
    }
};

#endif // STUDENT_H_
