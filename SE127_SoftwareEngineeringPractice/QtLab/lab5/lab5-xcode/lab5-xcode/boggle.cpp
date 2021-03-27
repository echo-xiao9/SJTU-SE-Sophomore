#include "lexicon.h"
#include <cctype>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <cstring>
#include <algorithm>
using namespace std;

void printResult(string board[],int n,int score,vector<string>yourWords){
    for(int i=0;i<n;i++)cout<<board[i]<<endl;
    cout<<"Your Score: "<< score<<endl;
    cout<<"Your Words: ";
    for(int i=0;i<yourWords.size();i++){
        string yourWord1 =yourWords[i];
        transform(yourWord1.begin(), yourWord1.end(), yourWord1.begin(),::tolower);
        cout<<yourWord1<<' ';
    }
    cout<<endl;
    
}

bool recurFindInBoard(string board[],int n,string word,int pos[],int num,int **marked){
   // cout<<"find:"<<word[num]<<endl;
    if(!word[num])
        return true;
    int dir[3]={0,1,-1};
    int newpos[2];
    int foundNextFlag=false;
    int i=0;int j=0;
    if(marked[pos[0]][pos[1]] == 1)return false;
    marked[pos[0]][pos[1]]=1;
    for(i=0;i<3;i++){
        if(((pos[0]+dir[i])>=0)&&((pos[0]+dir[i])<n))newpos[0]=pos[0]+dir[i];
        else continue;
        for(j=0;j<3;j++){
            if(i==0 && j==0)continue;
            if(((pos[1]+dir[j])>=0)&&((pos[1]+dir[j])<n))newpos[1]=pos[1]+dir[j];
            else continue;
            if(board[newpos[0]][newpos[1]]== word[num]){
                foundNextFlag = recurFindInBoard(board, n, word, newpos, num+1,marked);
                if(foundNextFlag)return true;
            }
           // cout<<endl;
        }
    }
    marked[pos[0]][pos[1]]=0;
    return false;
}

bool findInBoard(string board[],int n,string word,int pos[],int num){
    //find first letter
    int i=0;int j=0;int flag=false;
    int firstPos[2];
    int **marked= new int *[n];
    for(int i=0;i<n;i++)marked[i]=new int [n];
    //change word to capital letters
    transform(word.begin(), word.end(), word.begin(),::toupper);
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            if(board[i][j]==word[0]){
                firstPos[0]=i;
                firstPos[1]=j;
                flag = recurFindInBoard(board,n, word, firstPos, 1,marked);
                if(flag==true)return true;
            }
        }
    }
    for(int i = 0; i < n; i ++)
    delete [] marked[i];
    delete []marked;
    return false;//if flag == false;
}

bool findInDic(string inputWord,Lexicon &lex){
    return lex.contains(inputWord);
}

bool findInVec(string &inputWord,vector<string>&yourWords){
    for(int i=0;i<yourWords.size();i++){
        if(inputWord.compare(yourWords[i]) == 0)return true;
    }
    return false;
}




bool addWords(string words, vector<string>&yourWords,vector<string> &computerWords,Lexicon &lex){
    //Determine if the prefix matches the word requirement
    string words1=words;
    transform(words.begin(), words.end(), words.begin(),::tolower);
    transform(words1.begin(), words1.end(), words1.begin(),::toupper);
    if(words.length()<4){
        return false;
    }
    if ( std::find(yourWords.begin(), yourWords.end(), words1) != yourWords.end() ){
        return false;
    }
    if ( std::find(computerWords.begin(), computerWords.end(), words1) != computerWords.end() ){
        return false;
    }
    if(!lex.contains(words)){
        return false;
    }
    return true;
}

void recurComputerFind(string board[],int n,int &score,vector<string>&yourWords,vector<string> &computerWords,int pos[],int **marked, Lexicon &lex,string &prefix){
    int i=0;int j=0;int dir[3]={-1,0,1};int newpos[2];
    marked[pos[0]][pos[1]] = 1;
    for(i=0;i<3;i++){
        if(((pos[0]+dir[i])>=0)&&((pos[0]+dir[i])<n))newpos[0]=pos[0]+dir[i];//x行
        else continue;
        for(j=0;j<3;j++){
            if((i==1 && j==1))continue;
            if(((pos[1]+dir[j])>=0)&&((pos[1]+dir[j])<n))newpos[1]=pos[1]+dir[j];
            else continue;
            if(marked[newpos[0]][newpos[1]])continue;
            prefix.append(1,board[newpos[0]][newpos[1]]);
            if(addWords(prefix, yourWords, computerWords, lex)){
                score += prefix.length()-3;
                computerWords.push_back(prefix);
            }
            if(lex.containsPrefix(prefix))
                recurComputerFind(board, n, score, yourWords, computerWords, newpos, marked, lex, prefix);
            else prefix.pop_back();//if fail,delete the latest added word.
        }
    }
    prefix.pop_back();
    marked[pos[0]][pos[1]] = 0;
    return;
}
bool cmp(string s1,string s2){
    return s1<s2;
}
void computerFind(string board[],int n,vector<string>&yourWords, Lexicon &lex,int score){
    int firstPos[2]={0,0};
    int **marked= new int *[n];
    for (int i = 0; i < n; i++)
    {
        marked[i] = new int[n];
    }
    //don't forget to initialize the new array.
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++)
        marked[i][j]=0;
    }
    string prefix="";
    vector<string>computerWords;
    for(int j=0;j<n;j++){
        for(int k=0;k<n;k++){
            prefix="";
            firstPos[0]=j;//x
            firstPos[1]=k;//y
            prefix.append(1,board[j][k]);
            recurComputerFind(board, n, score, yourWords, computerWords, firstPos, marked, lex, prefix);
            prefix.clear();//清空字符串
        }
    }
    //sort the computerWords Vector
    sort(computerWords.begin(), computerWords.end(), cmp);
    cout<<"Computer Score: "<<score<<endl;
    cout<<"Computer Words:";
    for(int k=0;k<computerWords.size();k++)cout<<' '<<computerWords[k];
    for(int i = 0; i < n; i ++)
    delete [] marked[i];
    delete []marked;
}

int main(){
    int n=0;
    int yourScore=0;
    int comScore=0;
    int beginPos[2]={0,0};
    vector<string>yourWords;
    string inputWord="";
    Lexicon lex("EnglishWords.txt");
    cin>>n;
    string *board=new string[n+5];
    
    for(int i=0;i<n;i++){
        cin>>board[i];
    }
    while(true){
        printResult(board, n,yourScore,yourWords);
        cin>>inputWord;
        if(inputWord == "???")break;
        //check length
        if(inputWord.length()<4){
            cout<<inputWord<<" is too short."<<endl;
            continue;
        }
        if(!findInDic(inputWord,lex)){
            cout<<inputWord<<" is not a word."<<endl;
            continue;
        }
        string w = inputWord;
        transform(w.begin(), w.end(), w.begin(),::toupper);
        if(!findInBoard(board,n,inputWord,beginPos,0)){
            cout<<inputWord<<" is not on board."<<endl;
            continue;
        }
        if(std::find(yourWords.begin(), yourWords.end(), w) != yourWords.end()){
            cout<<inputWord<<" is already found."<<endl;
            continue;
        }
        yourWords.push_back(w);
        yourScore += inputWord.length()-3;
    }
    computerFind(board, n, yourWords, lex, comScore);
    delete []board;
    cout<<endl;
    
    return 0;
}

