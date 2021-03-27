#include "Class.h"
#include <string>
#include "Student.h"

void Class::addStudent(const Student &st)
{
    StudentWrapper sw(st.id, st);
    students.push_back(sw);
}

StudentWrapper &Class::getStudentWrapper(const std::string &studentId)
{
    for (std::vector<StudentWrapper>::iterator it = students.begin();
         it != students.end();
         ++it) {
        if (it->id == studentId)
            return *it;
    }
    throw ;
}

double Class::getAvgScore()
{
    double sum=0;
    int num_of_student=0;
    double avg=0;
    // TODO: implement getAvgScore.
    for (vector<StudentWrapper>::iterator it =students.begin();
         it != students.end();
         ++it) {
        ++num_of_student;
        sum+=it->getScore();
    }
    avg = sum/num_of_student;
    return avg;
}
