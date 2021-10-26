// HW2.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <iostream>
#include <GL/freeglut.h>
#include <vector>
#include <algorithm>
#include <fstream>
#include <cmath>
using namespace::std;

const float errNum= -10000;
const int BUF_SIZE=800;

struct Color {
    float R;
    float G;
    float B;
    Color operator+(Color c2) {
        return Color(R + c2.R, G + c2.G, B + c2.B);
    }
    Color operator-(Color c2) {
        return Color(R - c2.R, G - c2.G, B - c2.B);
    }
    Color operator*(float a) {
        return Color(a*R, a*G, a*B);
    }
    Color(float R, float G, float B):R(R),G(G),B(B){
    }
    Color() {}
};

struct Vertex {
    float x;
    float y;
    float z;
    Color c;
    Vertex(float x, float y, float z, Color c) :x(x), y(y), z(z),c(c) {}
    Vertex() {}
    
};

struct Line{
    Vertex v1;
    Vertex v2;
    Line(Vertex V1,Vertex V2):v1(V1),v2(V2){}
};

class Shape {
protected:
    // ordered vertexs
    vector<Vertex> vertexs;
    vector<Line> lines;
    Vertex isIntersect(Line l, float y){
        // the line need given clour.
        float x1 = l.v1.x;
        float y1 = l.v1.y;
        float z1 = l.v1.z;
        Color c1 = l.v1.c;
        float x2 = l.v2.x;
        float y2 = l.v2.y;
        float z2 = l.v2.z;
        Color c2 = l.v2.c;
        if(y>y1 && y<y2){
            float x = x1+(y-y1)/(y2-y1)*(x2-x1);
            float z = z1+(y-y1)/(y2-y1)*(z2-z1);
            Color c = c1+(c2-c1)*((y-y1)/(y2-y1));
            Vertex v(x,y,z,c);
            return v;
        }
        if(y>y2 && y<y1){
            float x = x2 + (y-y2)/(y1-y2)*(x1-x2);
            float z = z2 + (y-y2)/(y1-y2)*(z1-z2);
            Color c = c2 + (c1-c2)*((y-y2)/(y1-y2));
            Vertex v(x,y,z,c);
            return v;
        }
        // else do not intersect
        Color c(0,0,0);
        return Vertex(errNum,errNum,errNum, c) ;
    }
    static bool cmp(Vertex i,Vertex j){
        return i.y<j.y;
    }
    
public:
    Shape(vector<Vertex>&v){
        for (int i=0; i<v.size(); i++) vertexs.push_back(v[i]);
        scale(2);
        sort(vertexs.begin(),vertexs.begin()+vertexs.size(),cmp);
        for(int i=0;i<v.size();i++){
            for(int j=i+1;j<v.size();j++){
                lines.push_back(Line(vertexs[i],vertexs[j]));
            }
        }
    }
    void scale(float scale ){
        for(auto &v:vertexs){
            v.x*=scale;
            v.y*=scale;
            v.z*=scale;
        }
    }
    
    pair<Vertex, Vertex> getSweepVertexRange(float y){
        // get point of intersection of giver y
        // in this homework, only consider triangle and rectangle
        // so we only consider 2 intersaction with sweep line.
        int found=0;
        pair<Vertex, Vertex> interPair;
        for(int i=0;i<lines.size();i++){
            Vertex v =isIntersect(lines[i], y);
            if(v.x<errNum+1)continue;
            if(found==0)interPair.first = v;
            if(found ==1)interPair.second = v;
            found++;
            if(found == 2)return interPair;
        }
        Color c(0,0,0);
        Vertex verror1(errNum,errNum,errNum, c) ;
        Vertex verror2(errNum,errNum,errNum, c) ;
        interPair.first =verror1;
        interPair.second = verror2;
        return interPair;
    }
    
    
    pair<float, float> getYRange(){
        pair<float, float> p;
        p.first=vertexs[0].y;
        p.second=vertexs[vertexs.size()-1].y;
        return p;
    }
    
    vector<Vertex> lineVertexs(Vertex v1, Vertex v2){
        Vertex minV = (v1.x<v2.x)?v1:v2;
        Vertex maxV = (v1.x>v2.x)?v1:v2;
        assert(v1.y==v2.y);
        float z=0;Color c;
        vector<Vertex> vc;
        for(float x=minV.x;x<maxV.x;x+=0.5){
            z=(x-minV.x)/(maxV.x-minV.x)*(maxV.z-minV.z)+minV.z;
            c=(maxV.c-minV.c)*((x-minV.x)/(maxV.x-minV.x))+minV.c;
            vc.push_back(Vertex(x,minV.y,z,c));
        }
        return vc;
    }
    vector<Vertex> sweepLineVertexs(int y){
        pair<float, float> yRange= getYRange();
        pair<Vertex, Vertex> interVtx;
        vector<Vertex> vec;
        if(y<=yRange.first || y>= yRange.second)return vec;
        interVtx=getSweepVertexRange(y);
        if(interVtx.first.x<errNum+1)return vec; // no intersect line
        vec=lineVertexs(interVtx.first, interVtx.second);
        return vec;
    }
};

class Triangle :public Shape{
public:
    Triangle(vector<Vertex>&v):Shape(v){}
};
class Rectangle :public Shape{
public:
    Rectangle(vector<Vertex>&v):Shape(v){}
};

class zbuffer {
    // depth buffer
    int** buffer;
    int size;
public:
    zbuffer(int size):size(size) {
        buffer = new int* [size];
        for (int i = 0; i < size; i++) {
            buffer[i] = new int[size];
            for (int j = 0; j < size; j++) {
                buffer[i][j] = -100;
            }
        }
    }
    ~zbuffer() {
        for (int i = 0; i < size; i++) {
            delete[] buffer[i];
        }
        delete[] buffer;
    }
    float getZ(int x, int y) { return buffer[x + size/2][y + size/2]; }
    void setZ(int x, int y, int z) { buffer[x + size/2][y + size/2] = z; }
    const int** getBuffer() { return (const int**)buffer; }
};

class cbuffer {
    Color** buffer;
    int size;
public:
    cbuffer(int size):size(size) {
        buffer = new Color* [size];
        for (int i = 0; i < size; i++) {
            buffer[i] = new Color[size];
            for (int j = 0; j < size; j++) {
                buffer[i][j] = Color(1,1,1);
            }
        }
    }
    ~cbuffer() {
        for (int i = 0; i < size; i++) {
            delete[] buffer[i];
        }
        delete[] buffer;
    }
    Color getColor(int x, int y) { return buffer[x + size/2][y + size/2]; }
    void setColor(int x, int y, Color c) { buffer[x + size/2][y + size/2] = c; }
    const Color** getBuffer() { return (const Color**)buffer; }
};

std::ifstream& operator >> (std::ifstream& file, Vertex& v) {
    file >> v.x;
    file >> v.y;
    file >> v.z;
    return file;
}
std::ifstream& operator >> (std::ifstream& file, Color& cl) {
    file >> cl.R;
    file >> cl.G;
    file >> cl.B;
    return file;
}

void drawShape(std::vector<Shape*> shapes, int bufSize) {
    zbuffer zbuf(bufSize);
    cbuffer cbuf(bufSize);
    for (auto& s : shapes) {
        std::pair<int, int> yRange = s->getYRange();
        for (float y = yRange.first; y <= yRange.second; y+=1) {
            std::vector<Vertex> res = s->sweepLineVertexs(y);
            for (const Vertex& v : res) {
                if (v.z > zbuf.getZ(v.x, y)) {
                    cbuf.setColor(v.x, y, v.c);
                    zbuf.setZ(v.x, y, v.z);
                }
            }
        }
    }
    const Color** buf = cbuf.getBuffer();

    glBegin(GL_POINTS);
    int tt = 0;
    for (int i = 0; i < bufSize; i++) {
        for (int j = 0; j < bufSize; j++) {
            const Color clr = buf[i][j];
            if (clr.R == 1 && clr.G == 1 && clr.B == 1) {
                continue;
            }
            glColor3f(clr.R, clr.G, clr.B);
            // convert coordinate
            glVertex2f(i / (double)(bufSize/2) - 1, j / (double)(bufSize/2) - 1);
            
        }
    }
    glEnd();
    glFlush();
    std::cout << tt << std::endl;
}

void rotate(Vertex &v){
    v.x=v.x*1.732/2-v.z*1/2;
    v.z=v.z*1.732/2+v.x*1/2;
}

int getFileLineNum(string filename){
    ifstream infile(filename);//此处默认的文件打开方式为“以输出的方式打开”
    char str[1000000];//N是定义的常数，目的是为了读取足够长的行
    int n=0;//用来表示说读/写文本的行数
    while(!infile.eof())
    {
    infile.getline(str, sizeof(str));//此处默认的终止标识符为‘\n’
    n++;
    }
    infile.close();
    return n;
}

void drawTriangle(string filename) {
    //    std::ifstream file("overlapping.txt");
    std::ifstream file(filename);
    std::vector<Shape*> shapes;
    vector<Vertex>vct;
    int num=getFileLineNum(filename);
    for (int i = 0; i < num; i++) {
        vct.clear();
        Vertex pt1, pt2, pt3;
        file >> pt1 >> pt2 >> pt3;
        rotate(pt1);
        rotate(pt2);
        rotate(pt3);
        file >> pt1.c >> pt2.c >> pt3.c;
        vct.push_back(pt1);
        vct.push_back(pt2);
        vct.push_back(pt3);
        
        shapes.emplace_back(new Triangle(vct));
    }
    file.close();
    drawShape(shapes, BUF_SIZE);
    for (auto& s : shapes) delete s;
}

void drawRectangle() {
    std::vector<Shape*> shapes;
    vector<Vertex>vct;
    const Color blue = Color(68 / 255.0, 114 / 255.0, 196 / 255.0);
    const Color purple = Color(112 / 55.0, 48 / 255.0, 160 / 255.0);
    for (int i = 0; i < 4; i ++) {
        Vertex v1(100 + 80 * i, 0, 0,purple);
        Vertex v2(20 + 80 * i, 0, 0,purple);
        Vertex v3(100 + 80 * i, 360, 0,purple);
        Vertex v4(20 + 80 * i, 360, 0,purple);
        vct.push_back(v1);
        vct.push_back(v2);
        vct.push_back(v3);
        vct.push_back(v4);
        shapes.emplace_back(new Rectangle(vct));
    }
    drawShape(shapes, 800);
    for (auto& s : shapes)delete s;
}

void display() {
    glClearColor(1, 1, 1, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    static int index = 1;
    if (index == 0) {
        drawTriangle("overlapping.txt");
    }
    else if (index == 1) {
        drawTriangle("intersecting.txt");
    }
    else if (index == 2) {
        drawRectangle();
    }
    else{
        cout<<"index= "<<index<<" index can only be 0,1,2"<<endl;
    }
}


int main(int argc, char **argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(BUF_SIZE, BUF_SIZE);
    glutInitWindowPosition(0, 0);
    glutCreateWindow("hw2_518541910002_康艺潇");
    glutDisplayFunc(display);
    glutMainLoop();
    return 0;
}

