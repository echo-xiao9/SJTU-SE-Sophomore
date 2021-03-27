#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <limits.h>
#include <vector>
#include <queue>
#include <algorithm>

#include "Tree.h"

using namespace std;

/****************************************************************
 *                    Write your code below
 ****************************************************************/


int TreeNode::D = 0;

TreeNode::TreeNode()
{
    data[0] = data[1] = 0;
    ch[0] = ch[1] = nullptr;
}
int TreeNode::getX()
{
    return data[0];
}
int TreeNode::getY()
{
    return data[1];
}
void TreeNode::setX(int x)
{
    data[0] = x;
}
void TreeNode::setY(int y)
{
    data[1] = y;
}
void TreeNode::setD(int nowd)
{
    D = nowd;
}
TreeNode::~TreeNode()
{

}
/*****************************************************************************/

istream &operator>>(istream &in, BinaryDimonTree &tree)
{
    in >> tree.n;
    delete []tree.node;
    tree.node = nullptr;
    tree.node = new TreeNode[tree.n + 5];
    for (int i = 0; i < tree.n + 5; i++)
        tree.node[i].ch[0] = tree.node[i].ch[1] = nullptr;
    int x, y;
    for (int i = 1; i <= tree.n; i++)
    {
        in >> x >> y;
        tree.node[i].setX(x); tree.node[i].setY(y);
    }

    tree.build(tree.root, 1, tree.n, 0);
    return in;
}

void BinaryDimonTree::build(TreeNode*& rt, int ll ,int rr, int nowd)
{
    if(ll > rr)	return;
    int x = (ll + rr) >> 1;
    rt = &node[x];
    TreeNode::setD(nowd);
    nth_element(node + ll, node + x,node + rr + 1);
    build(rt->ch[0], ll, x - 1, nowd ^ 1);
    build(rt->ch[1], x + 1, rr, nowd ^ 1);
}

BinaryDimonTree::~BinaryDimonTree()
{
    delete[] node;
    node = nullptr;
}

TreeNode* BinaryDimonTree::find_nearest_node(int x, int y)
{
    long long int min_distance = LLONG_MAX;
    TreeNode *res = nullptr;
    recur_search(root, x, y, min_distance, res, 0);
    return res;
}

void BinaryDimonTree::recur_search(TreeNode *cur, int x, int y, long long int &min_distance, TreeNode *&guess, char nowd)
{
    if (cur == nullptr) return ;
    register long long dd = dist(cur, x, y);
    if (dd < min_distance || (dd == min_distance && cur->data[0] < guess->data[0]) ||
            (dd == min_distance && cur->data[0] == guess->data[0] && cur->data[1] < guess->data[1]))
    {
        min_distance = dd;
        guess = cur;
    }
    register int aD = (nowd ? y : x);
    recur_search(cur->ch[aD >= cur->data[nowd]], x, y, min_distance, guess, nowd ^ 1);

    if ((cur->data[nowd] - aD) * (cur->data[nowd] - aD) <= min_distance)
          recur_search(cur->ch[aD < cur->data[nowd]], x, y, min_distance, guess, nowd ^ 1);
}


BinaryDimonTree::BinaryDimonTree()
{
    n = 0;
    node = nullptr;
    root = nullptr;
}





