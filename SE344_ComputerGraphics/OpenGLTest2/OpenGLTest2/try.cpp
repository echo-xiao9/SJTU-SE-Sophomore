//
//#include <math.h>
//
//#include <gl/glut.h>
//
//#include <gl/gl.h>
//
//#define pi 3.1415926
//
//bool mouseisdown=false;
//
//bool loopr=false;
//
//int mx,my;
//
//int ry=30;
//
//int rx=30;
//
//void timer(int p)
//
//{
//
//     ry-=5;
//
//        glutPostRedisplay();                 //marks the current window as needing to be redisplayed.
//
//     if (loopr)
//
//         glutTimerFunc(200,timer,0);
//
//}
//
//void mouse(int button, int state, int x, int y)
//
//{
//
//    if(button == GLUT_LEFT_BUTTON)
//
//     {
//
//        if(state == GLUT_DOWN)
//
//         {    mouseisdown=true; loopr=false;}
//
//         else
//
//              mouseisdown=false;
//
//     }
//
//     if (button== GLUT_RIGHT_BUTTON)
//
//         if(state == GLUT_DOWN)
//
//         {loopr=true; glutTimerFunc(200,timer,0);}
//
//   
//
//}
//
//void motion(int x, int y)
//
//{
//
//    if(mouseisdown==true)
//
//    {
//
//        ry+=x-mx;
//
//         rx+=y-my;
//
//         mx=x;
//
//         my=y;
//
//         glutPostRedisplay();
//
//    }
//
//}
//
//void special(int key, int x, int y)
//
//{
//
//    switch(key)
//
//    {
//
//    case GLUT_KEY_LEFT:
//
//        ry-=5;
//
//        glutPostRedisplay();
//
//        break;
//
//    case GLUT_KEY_RIGHT:
//
//       ry+=5;
//
//        glutPostRedisplay();
//
//        break;
//
//    case GLUT_KEY_UP:
//
//        rx+=5;
//
//        glutPostRedisplay();
//
//        break;
//
//    case GLUT_KEY_DOWN:
//
//        rx-=5;
//
//        glutPostRedisplay();
//
//        break;
//
//    }
//
//}
//
//void display()
//
//{
//
//       
//
//         float red[3]={1,0,0};
//
//         float blue[3]={0,1,0};
//
//         float green[3]={0,0,1};
//
//         float yellow[3]={1,1,0};
//
//    
//         glClearColor(1,1,1,1);
//
//         glClear(GL_COLOR_BUFFER_BIT);
//
//         glLoadIdentity();
//
//         glRotatef(ry,0,1,0);
//
//         glRotatef(rx,1,0,0);
//
//         glColor3fv(green);
//
//         glutWireTeapot(0.5);
//
//        glFlush();
//
//}
//
//int main(int argc, char** argv)
//
//{
//
//    glutInit(&argc, argv);
//
//    glutInitDisplayMode (GLUT_SINGLE| GLUT_RGBA);
//
//    glutInitWindowSize (400, 400);
//
//    glutInitWindowPosition(100,100);
//
//    glutCreateWindow ("A TEAPOT");
//
//  
//
//    glutDisplayFunc (display);
//
//     glutMouseFunc(mouse);
//
//     glutMotionFunc(motion);
//
//     glutSpecialFunc(special);
//
//    glutMainLoop();
//
//    return 0;
//
//}
