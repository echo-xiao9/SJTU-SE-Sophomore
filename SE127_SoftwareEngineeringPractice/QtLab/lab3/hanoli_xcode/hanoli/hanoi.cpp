#include "termio.h"
using namespace std;
// Do not delete the following line
char Termio::buffer[Termio::CANVAS_HEIGHT][Termio::CANVAS_WIDTH + 1];
void autoPlay(Termio t,int n){
    t.hanoi(n, t.tower[0], t.tower[1], t.tower[2]);
    cout << "Congratulations! You win!" << std::endl;
}

int main() {
    // ---- Example: how to use termio.h ----
    while(true){
        // clear screen
        //Termio::Clear();
        // reset buffer
        //Termio::ResetBuffer();
        //write_hi();
        //Termio::Draw();*/
        // ----------- End of example -----------
        // Your code here
        char n;
        char x1;int x=0;int y=0;
        // some output hints that you should use.
        cout << "How many disks do you want? (1 ~ 5)" << std::endl;
        cin>>n;
        if(n=='Q') break;
        if(n<'0'||n>'5') break;
        Termio t(n-'0');
        cmdStack cs;
        t.prepareAndDraw();
        
        while(true){
            //aoto need to be complemented
            std::cout << "Move a disk. Format: x y" << std::endl;
            cin>>x1;
            if(x1=='Q') exit(0);
            cin>>y;
            x=x1-'0';
            if(x>=1 && x<=3 && y>=1 && y<=3 && t.compare(x-1, y-1)){
                t.move(x,y);
                cmd d(x,y);
                cs.push(d);
                t.prepareAndDraw();
                if(t.judge(n-'0')==true){
                    std::cout << "Congratulations! You win!" << std::endl;
                    break;
                }
            }
            else if(x == 0 && y == 0 ){
                while (cs.top_p>=0) {
                    cmd cmdGot = cs.pop();
                    t.move(cmdGot.to, cmdGot.from);
                    cout << "Auto moving:"<<cmdGot.to<<"->"<<cmdGot.from << endl;
                    t.prepareAndDraw();
                    if(t.judge(n-'0')==true){
                        std::cout << "Congratulations! You win!" << std::endl;
                        break;
                    }
                }
                autoPlay(t,n-'0');
                break;
            }
            else{
                t.prepareAndDraw();
            }
        }
        //    std::cout << "Auto moving:1->2" << std::endl;
        
    }
    return 0;
}
