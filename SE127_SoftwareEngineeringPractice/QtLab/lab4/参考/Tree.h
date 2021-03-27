//
// Created by Smile on 2019/4/8.
//

#ifndef C_BINARYDIMEN_TREE_H
#define C_BINARYDIMEN_TREE_H

#include <stdio.h>
#include <iostream>
#include <vector>
using namespace std;

/****************************************************************
 *                    Write your code below
 ****************************************************************/
class BinaryDimonTree;

class TreeNode
{
    friend ostream &operator<<(ostream &out, const TreeNode &b);
    friend class BinaryDimonTree;
    friend istream &operator>>(istream &in, BinaryDimonTree &tree);

private:
    TreeNode* ch[2];
    static int D;
    int data[2];

public:
    bool operator < (const TreeNode &t)const
    {
        return data[D] == t.data[D] ? data[D ^ 1] < t.data[D ^ 1] : data[D] < t.data[D];
    }
    int getX();  /* DO NOT CHANGE */
    int getY();  /* DO NOT CHANGE */
    void setX(int x);
    void setY(int y);
    static void setD(int nowd);
    TreeNode();
    ~TreeNode(); /* DO NOT CHANGE */
};


class BinaryDimonTree
{
friend istream &operator>>(istream &in, BinaryDimonTree &tree); /* DO NOT CHANGE */

private:
    int n;
    TreeNode *root;
    TreeNode *node;
    void build(TreeNode*& rt, int ll ,int rr, int nowd);

public:
    BinaryDimonTree();          /* DO NOT CHANGE */
    ~BinaryDimonTree();
    TreeNode *find_nearest_node(int x, int y);  /* DO NOT CHANGE */
    void recur_search(TreeNode *cur, int x, int y, long long int &min_distance, TreeNode *&guess, char nowd);
    long long int dist(TreeNode *cur, int x, int y)
    {
        return (long long)(cur->data[0] - x) * (cur->data[0] - x) + (long long)(cur->data[1] - y) * (cur->data[1] - y);
    }
};

istream &operator>>(istream &in, BinaryDimonTree &tree);


#endif //C_BINARYDIMEN_TREE_H
