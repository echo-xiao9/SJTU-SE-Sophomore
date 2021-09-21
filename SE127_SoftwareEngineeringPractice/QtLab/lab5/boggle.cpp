#include <iostream>
#include <algorithm>
#include <vector>
#include <string>
#include <cstring>
#include <unordered_set>
#include "lexicon.h"
using namespace std;

class jyz_vector: public vector<string>
{
public:
    bool find(string s)
    {
        for (vector<string>::iterator it = (*this).begin(); it != (*this).end(); it++)
        {
            if (*it == s)   return 1;
        }
        return 0;
    }
};

class AppX
{
public:
	AppX();
	~AppX();
	int run();
private:
	int N;
	char **board;
    int **vis;
    set<string> valid_word;
    jyz_vector user_word;
	int fx[8] = {0, 0, 1, 1, 1, -1, -1, -1};
	int fy[8] = {1, -1, 1, -1, 0, 1, -1, 0};
	string now_word;
	Lexicon dict;
    int user_score;
    int computer_score;

	void calc_valid_word();
    void dfs(int x, int y);
    void print_status();
    void computer_round();
    void user_round(string s);
};

int main()
{
	AppX app;
    return app.run();
}

AppX::AppX(): dict("EnglishWords.txt"), user_score(0), computer_score(0)
{
	cin >> N;
	board = new char*[N+5];
	for (int i = 1; i <= N; i++)
	{
		board[i] = new char[N+5];
        cin >> (board[i] + 1);
        for (int j = 1; j <= N; j++)
            board[i][j] = toupper(board[i][j]);
	}
    vis = new int*[N+5];
    for (int i = 1; i <= N; i++)
    {
        vis[i] = new int[N+5];
        memset(vis[i], 0, sizeof(int) * (N + 5));
    }

	calc_valid_word();
}
AppX::~AppX()
{
	for (int i = 1; i <= N; i++)
    {
        delete[] vis[i];
		delete[] board[i];
    }
    delete[] vis;
	delete[] board;
}

int AppX::run()
{
    while (1)
    {
        print_status();
        string s;
        cin >> s;
        if (s == "???")
        {
            computer_round();
            break;
        }
        else    user_round(s);
    }
    return 0;
}

void AppX::calc_valid_word()
{
	for (int i = 1; i <= N; i++)
		for (int j = 1; j <= N; j++)
                dfs(i, j);
}
void AppX::dfs(int x, int y)
{
    if (!dict.containsPrefix(now_word))	return;
    vis[x][y] = 1;
    string s("0");
    s[0] = board[x][y];
    now_word.append(s);
    if (now_word.length() >= 4 && dict.contains(now_word))
	{
		valid_word.insert(now_word);
	}
	for (int k = 0; k < 8; k++)
	{
		int tx = x + fx[k], ty = y + fy[k];
		if (tx >= 1 && tx <= N && ty >= 1 && ty <= N && !vis[tx][ty])
		{
            dfs(tx, ty);
		}
	}
	vis[x][y] = 0;
    now_word.erase(now_word.length() - 1);
}

void AppX::print_status()
{
    for (int i = 1; i <= N; i++, putchar('\n'))
        for (int j = 1; j <= N; j++)
            putchar(board[i][j]);
    printf("Your Score: %d\n", user_score);
    printf("Your Words:");
    if (!user_word.empty()) putchar(' ');
    for (vector<string>::iterator it = user_word.begin(); it != user_word.end(); )
    {
        string s(*it);
        transform(s.begin(),s.end(),s.begin(),::tolower);
        printf("%s", s.c_str());
        it++;
        if (it != user_word.end())  putchar(' ');
    }
    putchar('\n');
}
void AppX::computer_round()
{
    for (vector<string>::iterator it = user_word.begin(); it != user_word.end(); it++)
        valid_word.erase(*it);
    for (set<string>::iterator it = valid_word.begin(); it != valid_word.end(); it++)
        computer_score += (*it).length() - 3;
    printf("Computer Score: %d\n", computer_score);
    printf("Computer Words:");
    if (computer_score) putchar(' ');
    for (set<string>::iterator it = valid_word.begin(); it != valid_word.end();)
    {
        printf("%s", (*it).c_str());
        it++;
        if (it != valid_word.end()) putchar(' ');
    }
}

void AppX::user_round(string s)
{
    string str(s);
    transform(str.begin(),str.end(),str.begin(),::toupper);
    if (str.length() < 4)    printf("%s is too short.\n", s.c_str());
    else    if(!dict.contains(str))    printf("%s is not a word.\n", s.c_str());
    else    if (valid_word.find(str) == valid_word.end())    printf("%s is not on board.\n", s.c_str());
    else    if (user_word.find(str))    printf("%s is already found.\n", s.c_str());
    else
    {
        user_score += s.length() - 3;
        user_word.push_back(str);
    }
}
