// HW2.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <iostream>
#include <GL/freeglut.h>
#include <vector>
#include <algorithm>
#include <fstream>
#include <cmath>

const double PI = 3.1415926535897932;


struct color {
    float R;
    float G;
    float B;
    color operator+(color c2) {
        return color(R + c2.R, G + c2.G, B + c2.B);
    }
    color operator*(float a) {
        return color(a*R, a*G, a*B);
    }
    color(float R, float G, float B):R(R),G(G),B(B){
    }
    color() {}
};

std::ifstream& operator >> (std::ifstream& file, color& cl) {
    file >> cl.R;
    file >> cl.G;
    file >> cl.B;
    return file;
}

struct tuple {
    int x;
    color clr;
    int z;
    tuple(int x, color clr, int z) :x(x), clr(clr), z(z) {}
};

struct point {
    int x;
    int y;
    int z;
    point(int x, int y, int z) :x(x), y(y), z(z) {}
    point() {}
};
std::ifstream& operator >> (std::ifstream& file, point& pt) {
    file >> pt.x;
    file >> pt.y;
    file >> pt.z;
    return file;
}

class shape {
public:
    virtual std::vector<tuple> calLine(int y) = 0;
    virtual std::pair<int, int> getYRange() = 0;
};

class triangle : public shape {
    point pt[3];
    color clr[3];
    std::vector<int> yOrder;

public:
    std::pair<int,int> getYRange() {
        return std::pair<int, int>(pt[yOrder[0]].y,pt[yOrder[2]].y);
    }
    std::vector <tuple> calLine(int y) {
        //寻找交点
        std::vector<tuple> res;
        int yOrder0 = yOrder[0];
        int yOrder1 = yOrder[1];
        int yOrder2 = yOrder[2];
        if (y == pt[yOrder0].y) {
            res.emplace_back(pt[yOrder0].x, clr[yOrder0], pt[yOrder0].z);
            return res;
        }
        if (y > pt[yOrder0].y && y < pt[yOrder1].y) {
            float x1 = pt[yOrder0].x;
            float y1 = pt[yOrder0].y;
            float x2 = pt[yOrder1].x;
            float y2 = pt[yOrder1].y;
            float z1 = pt[yOrder0].z;
            float z2 = pt[yOrder1].z;
            color c1 = clr[yOrder0];
            color c2 = clr[yOrder1];
            float x3 = pt[yOrder2].x;
            float y3 = pt[yOrder2].y;
            float z3 = pt[yOrder2].z;
            color c3 = clr[yOrder2];
            float x4 = ((y - y1) / (y2 - y1) * (x2 - x1) + x1);
            float z4 = ((y - y1) / (y2 - y1) * (z2 - z1) + z1);
            float y4 = y;
            float x5 = ((y - y1) / (y3 - y1) * (x3 - x1) + x1);
            float z5 = ((y - y1) / (y3 - y1) * (z3 - z1) + z1);
            float y5 = y;
            color c4 = (c1 * ((y4 - y2) / (y1 - y2))) + (c2 * ((y1 - y4) / (y1 - y2)));
            color c5 = (c1 * ((y5 - y3) / (y1 - y3))) + (c3 * ((y1 - y5) / (y1 - y3)));
            if (x4 < x5) {
                for (int xp = x4; xp <= x5; xp++) {
                    color xpClr = (c4 * ((x5 - xp) / (x5 - x4)) + (c5 * ((xp - x4) / (x5 - x4))));
                    int z = (z5 - z4) / (x5 - x4) * (xp - x4) + z4;
                    res.emplace_back(xp, xpClr, z);
                }
                return res;
            }
            else{
                for (int xp = x5; xp <= x4; xp++) {
                    color xpClr = (c4 * ((x5 - xp) / (x5 - x4)) + (c5 * ((xp - x4) / (x5 - x4))));
                    int z = (z5 - z4) / (x5 - x4) * (xp - x4) + z4;
                    res.emplace_back(xp, xpClr, z);
                }
                return res;

            }

        }
        if (y == pt[yOrder1].y) {
            float x1 = pt[yOrder0].x;
            float y1 = pt[yOrder0].y;
            float x2 = pt[yOrder2].x;
            float y2 = pt[yOrder2].y;
            float z1 = pt[yOrder0].z;
            float z2 = pt[yOrder2].z;
            color c1 = clr[yOrder0];
            color c2 = clr[yOrder2];
            float x4 = ((y - y1) / (y2 - y1) * (x2 - x1) + x1);
            float z4 = ((y - y1) / (y2 - y1) * (z2 - z1) + z1);
            float y4 = y;
            float x5 = pt[yOrder1].x;
            float z5 = pt[yOrder1].y;
            float y5 = y;
            color c4 = (c1 * ((y4 - y2) / (y1 - y2))) + (c2 * ((y1 - y4) / (y1 - y2)));
            color c5 = clr[yOrder1];
            if (x4 < x5) {
                for (int xp = x4; xp <= x5; xp++) {
                    color xpClr = (c4 * ((x5 - xp) / (x5 - x4)) + (c5 * ((xp - x4) / (x5 - x4))));
                    int z = (z5 - z4) / (x5 - x4) * (xp - x4) + z4;
                    res.emplace_back(xp, xpClr, z);
                }
                return res;

            }
            else {
                for (int xp = x5; xp <= x4; xp++) {
                    color xpClr = (c4 * ((x5 - xp) / (x5 - x4)) + (c5 * ((xp - x4) / (x5 - x4))));
                    int z = (z5 - z4) / (x5 - x4) * (xp - x4) + z4;
                    res.emplace_back(xp, xpClr, z);
                }
                return res;

            }
        }
        if (y > pt[yOrder1].y && y < pt[yOrder2].y) {
            float x1 = pt[yOrder2].x;
            float y1 = pt[yOrder2].y;
            float x2 = pt[yOrder1].x;
            float y2 = pt[yOrder1].y;
            float z1 = pt[yOrder2].z;
            float z2 = pt[yOrder1].z;
            color c1 = clr[yOrder2];
            color c2 = clr[yOrder1];
            float x3 = pt[yOrder0].x;
            float y3 = pt[yOrder0].y;
            float z3 = pt[yOrder0].z;
            color c3 = clr[yOrder0];
            float x4 = ((y - y1) / (y2 - y1) * (x2 - x1) + x1);
            float z4 = ((y - y1) / (y2 - y1) * (z2 - z1) + z1);
            float y4 = y;
            float x5 = ((y - y1) / (y3 - y1) * (x3 - x1) + x1);
            float z5 = ((y - y1) / (y3 - y1) * (z3 - z1) + z1);
            float y5 = y;
            color c4 = (c1 * ((y4 - y2) / (y1 - y2))) + (c2 * ((y1 - y4) / (y1 - y2)));
            color c5 = (c1 * ((y5 - y3) / (y1 - y3))) + (c3 * ((y1 - y5) / (y1 - y3)));
            if (x4 < x5) {
                for (int xp = x4; xp <= x5; xp++) {
                    color xpClr = (c4 * ((x5 - xp) / (x5 - x4)) + (c5 * ((xp - x4) / (x5 - x4))));
                    int z = (z5 - z4) / (x5 - x4) * (xp - x4) + z4;
                    res.emplace_back(xp, xpClr, z);
                }
                return res;

            }
            else {
                for (int xp = x5; xp <= x4; xp++) {
                    color xpClr = (c4 * ((x5 - xp) / (x5 - x4)) + (c5 * ((xp - x4) / (x5 - x4))));
                    int z = (z5 - z4) / (x5 - x4) * (xp - x4) + z4;
                    res.emplace_back(xp, xpClr, z);
                }
                return res;

            }
        }
        if (y == pt[yOrder2].y) {
            res.emplace_back(pt[yOrder2].x, clr[yOrder2], pt[yOrder2].z);
        }

        return res;
    }
    triangle(point p1, color c1, point p2, color c2, point p3, color c3)  {
        pt[0] = p1;
        pt[1] = p2;
        pt[2] = p3;
        clr[0] = c1;
        clr[1] = c2;
        clr[2] = c3;
        yOrder.emplace_back(0);
        yOrder.emplace_back(1);
        yOrder.emplace_back(2);
        std::sort(yOrder.begin(), yOrder.end(), [&](int a, int b) {return pt[a].y < pt[b].y;});
    }

};
namespace rect {
    enum recColor { BLUE, PURPLE };
    const color blue = color(68 / 255.0, 114 / 255.0, 196 / 255.0);
    const color purple = color(112 / 55.0, 48 / 255.0, 160 / 255.0);
}
class rectangle : public shape {
    std::pair<int, int> xRange;
    std::pair<int, int> yRange;
    rect::recColor c;
    color recColor;


public:
    rectangle(point pt1, point pt2, rect::recColor clr) {
        xRange.first = std::min(pt1.x, pt2.x);
        xRange.second = std::max(pt1.x, pt2.x);
        yRange.first = std::min(pt1.y, pt2.y);
        yRange.second = std::max(pt1.y, pt2.y);
        this->c = clr;
        this->recColor = clr == rect::BLUE ? rect::blue : rect::purple;
    }
    std::pair<int, int> getYRange() {
        return yRange;
    }
    std::vector<tuple>calLine(int y) {
        std::vector<tuple> res;
        if (y > yRange.second || y < yRange.first)return res;
        if (this->c == rect::BLUE) {
            for (int x = xRange.first;x <= xRange.second; x++) {
                int z = (int)(80 * sin(PI / 160 * (x + y) - PI / 2));
                res.emplace_back(tuple(x, this->recColor, z));
            }
            return res;
        }
        else {
            for (int x = xRange.first;x <= xRange.second; x++) {
                int z = (int)(80 * sin(PI / 160 * (x + y) + PI / 2));
                res.emplace_back(tuple(x, this->recColor, z));
            }
            return res;
        }
    }
};

class zbuffer {
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
    int getZ(int x, int y) { return buffer[x + size/2][y + size/2]; }
    void setZ(int x, int y, int z) { buffer[x + size/2][y + size/2] = z; }
    const int** getBuffer() { return (const int**)buffer; }
};

class cbuffer {
    color** buffer;
    int size;
public:
    cbuffer(int size):size(size) {
        buffer = new color* [size];
        for (int i = 0; i < size; i++) {
            buffer[i] = new color[size];
            for (int j = 0; j < size; j++) {
                buffer[i][j] = color(1,1,1);
            }
        }
    }
    ~cbuffer() {
        for (int i = 0; i < size; i++) {
            delete[] buffer[i];
        }
        delete[] buffer;
    }
    color getColor(int x, int y) { return buffer[x + size/2][y + size/2]; }
    void setColor(int x, int y, color c) { buffer[x + size/2][y + size/2] = c; }
    const color** getBuffer() { return (const color**)buffer; }
};

void drawShape(std::vector<shape*> shapes, int bufSize) {
    zbuffer zbuf(bufSize);
    cbuffer cbuf(bufSize);
    for (auto& s : shapes) {
        std::pair<int, int> yRange = s->getYRange();
        for (int y = yRange.first; y <= yRange.second; y++) {
            std::vector<tuple> res = s->calLine(y);
            for (const tuple& t : res) {
                if (t.z > zbuf.getZ(t.x, y)) {
                    cbuf.setColor(t.x, y, t.clr);
                    zbuf.setZ(t.x, y, t.z);
                }
            }
        }
    }
    const color** buf = cbuf.getBuffer();
    glBegin(GL_POINTS);
    int tt = 0;
    for (int i = 0; i < bufSize; i++) {
        for (int j = 0; j < bufSize; j++) {
            const color clr = buf[i][j];
            if (clr.R == 1 && clr.G == 1 && clr.B == 1) {
                continue;
            }
            glColor3f(clr.R, clr.G, clr.B);
            glVertex2f(i / (double)(bufSize/2) - 1, j / (double)(bufSize/2) - 1);
        }
    }
    glEnd();
    glFlush();
    std::cout << tt << std::endl;
}

void drawFirstTriangle() {
    std::ifstream file("overlapping.txt");
    std::vector<shape*> shapes;
    for (int i = 0; i < 4; i++) {
        point pt1, pt2, pt3;
        color clr1, clr2, clr3;
        file >> pt1 >> pt2 >> pt3;
        file >> clr1 >> clr2 >> clr3;
        shapes.emplace_back(new triangle(pt1, clr1, pt2, clr2, pt3, clr3));

    }
    file.close();
    drawShape(shapes, 300);
    for (auto& s : shapes)delete s;


}

void drawSecondTriangle() {
    std::ifstream file("intersecting.txt");
    std::vector<shape*> shapes;
    for (int i = 0; i < 2; i++) {
        point pt1, pt2, pt3;
        color clr1, clr2, clr3;
        file >> pt1 >> pt2 >> pt3;
        file >> clr1 >> clr2 >> clr3;
        shapes.emplace_back (new triangle(pt1, clr1, pt2, clr2, pt3, clr3));
    }
    file.close();
    drawShape(shapes, 300);
    for (auto& s : shapes)delete s;
}

void drawFirstRectangle() {
    cbuffer cbuf(800);
    zbuffer zbuf(800);
    std::vector<shape*> shapes;
    for (int i = 0; i < 4; i ++) {
        shapes.emplace_back(new rectangle(point(-280 + 160 * i, -360, 0), point(-200 + 160 * i, 360, 0),rect::PURPLE));
    }
    for (int i = 0; i < 4; i++) {
        shapes.emplace_back(new rectangle(point(-360, -280 + 160 * i, 0), point(360, -200 + 160 * i, 0), rect::BLUE));
    }
    drawShape(shapes, 800);
    for (auto& s : shapes)delete s;
}


void display() {
    glClearColor(1, 1, 1, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    static int i = 0;
    if (i == 0) {
        drawFirstTriangle();
        i++;
    }
    else if (i == 1) {
        drawSecondTriangle();
        i++;
    }
    else if (i == 2) {
        drawFirstRectangle();
    }
}

int main(int argc, char **argv) {
    glutInit(&argc, argv);



    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(300, 300);
    glutInitWindowPosition(200, 200);
    glutCreateWindow("CG_HW2");
    glRotatef(45.0, 1.0, 0.0, 0.0);
    glutDisplayFunc(display);
    glutMainLoop();

    return 0;
}

