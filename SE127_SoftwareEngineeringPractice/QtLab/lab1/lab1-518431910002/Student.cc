#include "Student.h"
#include <string>
#include <sstream>
#include "Class.h"
using namespace std;

std::string Student::toString() const
{
    // TODO: uncomment the following code after implementing class Student.

    std::ostringstream oss;
    oss << "Student Information:"
        << "\n\tid: " << id
        << "\n\tname: " << name
        << "\n\tenrollment year: " << year
        << "\n\tdegree: " << (degree == graduate ? "graduate" : "undergraduate")
        << std::endl;
    return oss.str();
}

void Student:: addClass(Class*c){
    classes.push_back(c);
}
double Undergraduate::getGrade(){
    double single_score=0;
    double sum_score_times_point=0;
    int single_point=0;
    int sum_point=0;
    double grade=0;
    //get the sum of score times points of classes.
    for (std::vector<Class*>::iterator it = classes.begin();
         it != classes.end();
         ++it) {
        single_score=(*it)->getStudentWrapper(id).getScore();
        single_point=(*it)->point;
        sum_point+=single_point;
        sum_score_times_point+=single_score*single_point;
    }
    //calculate grade follow the rules of Undergraduate.
    grade = sum_score_times_point/20/sum_point;
    return grade;
}
double Graduate::getGrade(){
    double single_score=0;
    double single_credits=0;
    double grade=0;
    int single_point=0;
    double sum_credits_times_point=0;
    int sum_point=0;

    for (std::vector<Class*>::iterator it = classes.begin();
         it != classes.end();
         ++it) {
        single_score=(*it)->getStudentWrapper(id).getScore();
        single_point=(*it)->point;
        switch (int (single_score/10)) {
        case 10: single_credits=4.0;break;
        case 9: single_credits=4.0;break;
        case 8: single_credits=3.5;break;
        case 7: single_credits=3.0;break;
        case 6: single_credits=2.5;break;
        default: single_credits=2.0;break;
        }
        sum_credits_times_point+=single_credits*single_point;
        sum_point+=single_point;
    }
    grade = sum_credits_times_point/sum_point;
    return grade;

}

// TODO: implement functions which are declared in Student.h.
