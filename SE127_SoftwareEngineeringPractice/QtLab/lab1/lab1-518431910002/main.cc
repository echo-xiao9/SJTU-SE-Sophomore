#include <vector>
#include <iostream>
#include <fstream>
#include "Class.h"
#include "Student.h"
#include<exception>
#include <string>

using namespace std;



class AppX {
private:
    vector<Student *> studentVec;
    vector<Class *> classVec;

    void loadFiles();
    void inputScore();
    void printAvgScore();
    void printGpa();

public:
    AppX();
    ~AppX();
    int run();
    Class* findClass(string Name);
    Student*findStudent(string Id);
    double strDou(string str);
    class Id_error{};
    class class_error{};
    class score_error{};
};





AppX::~AppX()
{
    // You can use the traditional loop, which is more clear.
    for (vector<Class *>::iterator it = classVec.begin();
         it != classVec.end();
         ++it) {
        if (*it) delete (*it);
    }
    // You can use modern and simpler loops only if you know what it is doing.
    for (const auto &s: studentVec) {
        if (s) delete (s);
    }
}

AppX::AppX()
{
    loadFiles();
}

void AppX::loadFiles()
{
    string line,line1;
    size_t pos1, pos2;
    vector<string> bufv;
    Student *st = nullptr;
    string clsname;
    int point;
    Class *cl = nullptr;

    // Open a file as a input stream.
    ifstream stfile("./Students.txt");


    while (getline(stfile, line)) {

        if (line.empty()) // It's an empty line.
            continue;
        if (line[0] == '#') // It's a comment line.
            continue;

        // The bufv vector stores each columnes in the line.
        bufv.clear();
        // Split the line into columes.
        //   pos1: begining the the column.
        //   pos2: end of the column.
        pos1 = 0;
        while (true) {
            pos2 = line.find(';', pos1 + 1);
            if (pos2 == string::npos) { // No more columns.
                // Save the last column (pos1 ~ eol).
                bufv.push_back(line.substr(pos1, string::npos));
                break;
            }
            else {
                // Save the column (pos1 ~ pos2).
                bufv.push_back(line.substr(pos1, pos2 - pos1));
            }
            pos1 = pos2 + 1;
        }

        // TODO: uncomment next lines after implementing class Undergraduate
        // and Graduate.

        if (bufv[3] == "U"){
            st = new Undergraduate(bufv[0], bufv[1], bufv[2]);}
        else{
            st = new Graduate(bufv[0], bufv[1], bufv[2]);}
        studentVec.push_back(st);
    }
       stfile.close();

    // TODO: load data from ./Classes.txt and push objects to the vector.
    // Hint: how is student information read?
       ifstream clfile("./Classes.txt");
       while (getline(clfile, line1)) {
           if (line1.empty()) // It's an empty line.
               continue;
           if (line1[0] == '#') // It's a comment line.
               continue;
           if (line1[0] == 'C') {//It's a class.
               int length_of_class = line1.length()-6;
               clsname = line1.substr(6, length_of_class);
           }
           if (line1[0] == 'P'){
               point = line1[7]-'0';
               cl =new Class(clsname, point);
               classVec.push_back(cl);

               //add student to class and add class to student
               while (getline(clfile, line1)&&!line1.empty()) {
                   string studentId = line1;
                   for (vector<Student *>::iterator it = studentVec.begin();
                        it != studentVec.end();
                        ++it) {
                       if ((*it) -> id == studentId){ //it is a pointer,need* and ()
                           cl->addStudent(**it);
                           (*it)-> addClass(cl);
                       }
                   }
               }
           }
       }

    clfile.close();
}


void AppX::inputScore()
{
    // TODO: implement inputScore.
    // Hint: Take a look at printAvgScore().
    string sbuf,id;
    Class *cl=nullptr;
    string score;
    int Score;
    Student* st;

    while (true) {

        cout << "Please input the class name (or input q to quit): ";
        try {
            cin >> sbuf;
            if(sbuf=="q")break;
            cl=findClass(sbuf);
            if (cl == nullptr) {
                throw (class_error ());
            }
        } catch (class_error) {
            cout<<"No match class!\n";
            continue;
        }

        if (sbuf == "q") break;
        cl = findClass(sbuf);

        //already find the class
        while (true) {
            cout<<"Please input the student id(or input q to quit):";
            try{
            cin >> id;
            if (id == "q") break;
            st=findStudent(id);
            if(st==nullptr){
                throw (Id_error());
            }

            }catch(Id_error){
                cout<<"No match student!\n";
                continue;}

            StudentWrapper &sw = cl->getStudentWrapper(id);
            cout<<sw.toString();
            try{
            cin >> score;
            if (score == "q") break;
            sw.setScore(stof(score));
            }catch(const char* s){
                cout<<"Wrong score!\n";}
        }
    }
}


void AppX::printAvgScore()
{
    string sbuf;
    Class *cl;
    double avg;

    while (true) {
        cout << "Please input the class name (or input q to quit): ";
        try {
            cin >> sbuf;
             if(sbuf=="q")break;
            cl=findClass(sbuf);
            if (cl == nullptr) {
                throw (class_error ());
                continue;
            }
        } catch (class_error) {
            cout<<"No match class!\n";
            continue;
        }

        avg = cl->getAvgScore();
       printf("The average score is: %.2f\n",avg);
    }
}

double AppX:: strDou(string str) {	//string 转换 double
    char *ch = new char[0];
    double d;
    for (int i = 0; i != str.length(); i++)
        ch[i] = str[i];
    d = atof(ch);
    return d;
}



void AppX::printGpa()
{
    // TODO: implement printGpa.
    // Hint: Take a look at printAvgScore().
    Student*st;
    string id;
    double grade=0;
    while(true){
        cout<<"Please input the student id(or input q to quit):";
        try{
        cin >> id;
        if (id == "q") break;
        st=findStudent(id);

        if(st==nullptr){
            throw (Id_error());
        }
        }catch(Id_error){
            cout<<"No match student!\n";
            continue;
        }

        grade= findStudent(id)->getGrade();
        printf("GPA = %.2f\n",grade);
    }



}

int AppX::run()
{
    char cmd;
    while (true) {
        cout << "Command menu:\n"
             << "\ti: Input score\n"
             << "\ta: Compute average score of a class\n"
             << "\tg: Compute grade of a student\n"
             << "\tq: Quit\n"
             << "Please input the command: ";
        cin >> cmd;
        if (cmd == 'i') {
            inputScore();
        } else if (cmd == 'a') {
            printAvgScore();
        } else if (cmd == 'g') {
            printGpa();
        } else if (cmd == 'q') {
            break;
        } else {
            cout << "Invalid command!\n" << endl;
        }
    }
    return 0;
}

Class* AppX::findClass(string Name){
    Class *cl;
    for (vector<Class *>::iterator it = classVec.begin();
         it != classVec.end();
         ++it) {
        if ((*it)->name == Name) {
            cl = *it;
            return cl;
        }
    }
    return NULL;
}

Student* AppX::findStudent(string Id){
    Student *st;
    for (vector<Student *>::iterator it = studentVec.begin();
         it != studentVec.end();
         ++it) {
        if ((*it)->id == Id) {
            st = *it;
            return st;
        }
    }
    return NULL;
}





int main()
{
    AppX app;
    return app.run();
}
