/*
 * File: lexicon.cpp
 * -----------------
 * A Lexicon is a word list. This Lexicon is backed by a data
 * structure called a prefix tree or trie ("try").
 *
 * This is a re-implementation of Lexicon.  Its previous implementation used
 * a pair of structures: a directed acyclic word graph (DAWG) and an STL set.
 * This implementation was discarded because of several reasons:
 *
 * - It relied on binary file formats that were not readable by students.
 * - It did not provide for expected class members like remove.
 * - It had a clunky pair of data structures that had to be searched separately.
 * - It was optimized for space usage over ease of use and maintenance.
 *
 * The original DAWG implementation is retained as dawglexicon.h/cpp.
 *
 * @version 2014/11/13
 * - added comparison operators <, >=, etc.
 * - added hashCode function
 * @version 2014/10/10
 * - added comparison operators ==, !=
 * - removed 'using namespace' statement
 */

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
using  namespace std;
static bool scrub(std::string& str);
static std::string trim(const std::string &str)
{
    std::string s(str);
    s.erase(s.find_last_not_of(" \t") + 1);
    s.erase(0, s.find_first_not_of(" \t"));
    return s;
}

Lexicon::Lexicon() {
    m_root = nullptr;
    m_size = 0;
}

Lexicon::Lexicon(const std::string& filename) {
    m_root = nullptr;
    m_size = 0;
    addWordsFromFile(filename);
}

Lexicon::Lexicon(const Lexicon& src) {
    m_root = nullptr;
    m_size = 0;
    deepCopy(src);
}

Lexicon::~Lexicon() {
    clear();
}

bool Lexicon::add(const std::string& word) {
    if (word.empty()) {
        return false;
    }
    std::string scrubbed = word;
    if (!scrub(scrubbed)) {
        return false;
    }
    return addHelper(m_root, scrubbed, /* originalWord */ scrubbed);
}

void Lexicon::addWordsFromFile(const std::string& filename) {
    std::ifstream istr(filename);
    if (istr.fail()) {
        throw new std::runtime_error("Lexicon::addWordsFromFile: Couldn't open lexicon file " + filename);
    }
    std::string line;
    while (getline(istr, line)) {
        add(trim(line));
    }
    istr.close();
}

void Lexicon::clear() {
    m_size = 0;
    m_allWords.clear();
    deleteTree(m_root);
    m_root = nullptr;
}

bool Lexicon::contains(const std::string& word) const {
    if (word.empty()) {
        return false;
    }
    std::string scrubbed = word;
    if (!scrub(scrubbed)) {
        return false;
    }
    return containsHelper(m_root, scrubbed, /* isPrefix */ false);
}

bool Lexicon::containsPrefix(const std::string& prefix) const {
    if (prefix.empty()) {
        return true;
    }
    std::string scrubbed = prefix;
    if (!scrub(scrubbed)) {
        return false;
    }
    return containsHelper(m_root, scrubbed, /* isPrefix */ true);
}

bool Lexicon::equals(const Lexicon& lex2) const {
    // optimization: if literally same lexicon, stop
    if (this == &lex2) {
        return true;
    }
    if (size() != lex2.size()) {
        return false;
    }
    return m_allWords == lex2.m_allWords;
}

bool Lexicon::isEmpty() const {
    return size() == 0;
}

void Lexicon::mapAll(void (*fn)(std::string)) const {
    for (std::string word : m_allWords) {
        fn(word);
    }
}

void Lexicon::mapAll(void (*fn)(const std::string&)) const {
    for (std::string word : m_allWords) {
        fn(word);
    }
}

bool Lexicon::remove(const std::string& word) {
    if (word.empty()) {
        return false;
    }
    std::string scrubbed = word;
    if (!scrub(scrubbed)) {
        return false;
    }
    return removeHelper(m_root, scrubbed, /* originalWord */ scrubbed, /* isPrefix */ false);
}

bool Lexicon::removePrefix(const std::string& prefix) {
    if (prefix.empty()) {
        bool result = !isEmpty();
        clear();
        return result;
    }
    std::string scrubbed = prefix;
    if (!scrub(scrubbed)) {
        return false;
    }
    
    return removeHelper(m_root, scrubbed, /* originalWord */ scrubbed, /* isPrefix */ true);
}

int Lexicon::size() const {
    return m_size;
}

std::set<std::string> Lexicon::toStlSet() const {
    std::set<std::string> result;
    for (std::string word : m_allWords) {
        result.insert(word);
    }
    return result;
}

/* private helpers implementation */

// pre: word is scrubbed to contain only lowercase a-z letters
bool Lexicon::addHelper(TrieNode*& node, const std::string& word, const std::string& originalWord) {
    if (node == nullptr) {
        // create nodes all the way down, one for each letter of the word
        node = new TrieNode();
    }
    
    if (word.empty()) {
        // base case: we have added all of the letters of this word
        if (node->isWord()) {
            return false;   // duplicate word; already present
        } else {
            // new word; add it
            node->setWord(true);
            m_size++;
            m_allWords.insert(originalWord);
            return true;
        }
    } else {
        // recursive case: chop off first letter, traverse the rest
        return addHelper(node->child(word[0]), word.substr(1), originalWord);
    }
}

// pre: word is scrubbed to contain only lowercase a-z letters
bool Lexicon::containsHelper(TrieNode* node, const std::string& word, bool isPrefix) const {
    if (node == nullptr) {
        // base case: no pointer down to here, so prefix must not exist
        return false;
    } else if (word.length() == 0) {
        // base case: Found nodes all the way down.
        // If we are looking for a prefix, this means this path IS a prefix,
        // so we should return true.
        // If we are looking for an exact word match rather than a prefix,
        // we must check the isWord flag to see that this word was added
        return (isPrefix ? true : node->isWord());
    } else {
        // recursive case: follow appropriate child pointer for one letter
        return containsHelper(node->child(word[0]), word.substr(1), isPrefix);
    }
}

// pre: word is scrubbed to contain only lowercase a-z letters
bool Lexicon::removeHelper(TrieNode*& node, const std::string& word, const std::string& originalWord, bool isPrefix) {
    if (node == nullptr) {
        // base case: dead end; this word/prefix must not be contained
        return false;
    } else if (word.empty()) {
        // base case: we have walked all of the letters of this word/prefix
        // and now we must do the removal
        if (isPrefix) {
            // remove this node and all of its descendents
            removeSubtreeHelper(node, originalWord);   // removes from m_allWords, sets m_size
            node = nullptr;
        } else {
            // remove / de-word-ify this node only
            if (node->isLeaf()) {
                delete node;
                node = nullptr;
            } else {
                if (node->isWord()) {
                    node->setWord(false);
                    m_allWords.erase(originalWord);
                    m_size--;
                }
            }
        }
        return true;
    } else {
        // recursive case: chop off first letter, traverse the rest
        return removeHelper(node->child(word[0]), word.substr(1), originalWord, isPrefix);
    }
}

// remove/free this node and all descendents
void Lexicon::removeSubtreeHelper(TrieNode*& node, const std::string& originalWord) {
    if (node != nullptr) {
        for (char letter = 'a'; letter <= 'z'; letter++) {
            removeSubtreeHelper(node->child(letter), originalWord + letter);
        }
        if (node->isWord()) {
            m_allWords.erase(originalWord);
            m_size--;
        }
        delete node;
        node = nullptr;
    }
}

void Lexicon::deepCopy(const Lexicon& src) {
    for (std::string word : src.m_allWords) {
        add(word);
    }
}

void Lexicon::deleteTree(TrieNode* node) {
    if (node != nullptr) {
        for (char letter = 'a'; letter <= 'z'; letter++) {
            deleteTree(node->child(letter));
        }
        delete node;
    }
}

Lexicon& Lexicon::operator=(const Lexicon& src) {
    if (this != &src) {
        clear();
        deepCopy(src);
    }
    return *this;
}

static bool scrub(std::string& str) {
    size_t nChars = str.length();
    size_t outIndex = 0;
    for (size_t i = 0; i < nChars; i++) {
        std::string::value_type ch = static_cast<std::string::value_type>(tolower(str[i]));
        if (ch < 'a' || ch > 'z') {
            return false;   // illegal string
        } else {
            str[outIndex] = ch;
            outIndex++;
        }
    }
    if (outIndex != nChars) {
        str.erase(outIndex, nChars - outIndex);
    }
    return true;
}
void printResult(string board[],int n,int score,vector<string>yourWords){
    for(int i=0;i<n;i++)cout<<board[i]<<endl;
    cout<<"Your Score: "<< score<<endl;
    cout<<"Your Words: ";
    for(int i=0;i<yourWords.size();i++)cout<<yourWords[i]<<' ';
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
    if(marked[pos[0]][pos[1]]==1)return false;
    marked[pos[0]][pos[1]]=1;
    for(i=0;i<3;i++){
        if(((pos[0]+dir[i])>=0)&&((pos[0]+dir[i])<n))newpos[0]=pos[0]+dir[i];
        else continue;
        for(j=0;j<3;j++){
            if(i==0 && j==0)continue;
            if(((pos[1]+dir[j])>=0)&&((pos[1]+dir[j])<n))newpos[1]=pos[1]+dir[j];
            else continue;
           // cout<<"point to:"<<board[newpos[0]][newpos[1]]<<"  "<<"center:"<<board[pos[0]][pos[1]]<<endl;
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
    for(int k=0;k<word.length();k++)word[k]+='A'-'a';
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            if(board[i][j]==word[0]){
                firstPos[0]=i;firstPos[1]=j;
                flag = recurFindInBoard(board, n, word, firstPos, 1,marked);
                if(flag==true)return true;
            }
        }
    }
    for(int i = 0; i < n; i ++)
    delete [] marked[i];
    delete []marked;
    return false;//if flag == false;
}

bool findInDic(string inputWord,Lexicon lex){
    return lex.contains(inputWord);
}

bool findInVec(string inputWord,vector<string>yourWords){
    for(int i=0;i<yourWords.size();i++){
        if(inputWord.compare(yourWords[i]) == 0)return true;
    }
    return false;
}
bool findV(vector<string>&v, string s){
    for(int i=0;i<s.length();i++){
        s[i]+='a'-'A';
    }
    for(int i=0;i<v.size();i++){
        if(s==v[i])return true;
    }
    return false;
}
bool addWords(string words, vector<string>&yourWords,vector<string> &computerWords,Lexicon &lex){
    //Determine if the prefix matches the word requirement
    string words1=words;
    if(words.length()<4){
        return false;
    }
    for(int i=0;i<words.length();i++){
        words1[i]+='a'-'A';
    }
    if ( std::find(yourWords.begin(), yourWords.end(), words1) != yourWords.end() ){
        return false;
    }
    
    if ( std::find(computerWords.begin(), computerWords.end(), words) != computerWords.end() ){
        return false;
    }
//    if(findV(yourWords,words)){
//        foundYourFlag = 0;// found before.
//        return false;
//    }
//    if(findV(computerWords, words)){
//        foundComFlag = 0;// found before.
//        return false;
//    }
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
void computerFind(string board[],int n,vector<string>&yourWords, Lexicon lex,int score){
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
int marked [5][5];
int main(){
    int n=0;
    int yourScore=0;
    int comScore=0;
    int beginPos[2]={0,0};
    vector<string>yourWords;
    string inputWord="";
    Lexicon lex("EnglishWords.txt");
    cin>>n;
    string board[5];
    memset(board, ' ', sizeof(board));//initialize board
    for(int i=0;i<n;i++){
        cin>>board[i];
    }
    for(int i=0;i<5;i++){
        for (int j=0; j<5; j++) {
            marked[i][j]=0;
        }
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
        if(!findInBoard(board,n,inputWord,beginPos,0)){
            cout<<inputWord<<" is not on board."<<endl;
            continue;
        }
        if(!findInDic(inputWord,lex)){
            cout<<inputWord<<" is not a word."<<endl;
            continue;
        }
        if(findInVec(inputWord,yourWords)){
            cout<<inputWord<<" is already found."<<endl;
            continue;
        }
        yourWords.push_back(inputWord);
        yourScore += inputWord.length()-3;
    }
    computerFind(board, n, yourWords, lex, comScore);
    cout<<endl;
    return 0;
}
