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
private:

public:
    TreeNode* ch[2];
    static int axis;
    int data[2];
    bool operator < (const TreeNode &t)const
    {
        return data[axis] == t.data[axis] ? data[axis ^ 1] < t.data[axis ^ 1] : data[axis] < t.data[axis];
    }
    int getX();  /* DO NOT CHANGE */
    int getY();  /* DO NOT CHANGE */

    TreeNode();
    ~TreeNode(); /* DO NOT CHANGE */
};


class BinaryDimonTree
{
friend istream &operator>>(istream &in, BinaryDimonTree &tree); /* DO NOT CHANGE */

private:
    int n;
    TreeNode *root;
    TreeNode *array;
    void createTree(TreeNode*& cur, int lIdx ,int rIdx, int axis);

public:
    BinaryDimonTree();          /* DO NOT CHANGE */
    ~BinaryDimonTree();
    TreeNode *find_nearest_node(int x, int y);  /* DO NOT CHANGE */
    long long int Dist(TreeNode *a,long long int x,long long int y);
    void recur_search(TreeNode *cur, long long int target[], long long int &min_distance, TreeNode *&guess,int axis);
    bool less(TreeNode *a,TreeNode *g,long long int d,long long int minD);

};

istream &operator>>(istream &in, BinaryDimonTree &tree);


#endif //C_BINARYDIMEN_TREE_H


