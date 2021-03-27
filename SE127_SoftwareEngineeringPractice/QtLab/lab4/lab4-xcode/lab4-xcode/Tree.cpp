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

istream &operator>>(istream &in, BinaryDimonTree &tree)
{
    in >> tree.n;
    tree.array = nullptr;
    tree.array = new TreeNode[tree.n];
    for (int i=1; i<=tree.n; i++) {
        int x=0; int y=0;
        in>>x>>y;
        tree.array[i].data[0]=x;
        tree.array[i].data[1]=y;
    }
    tree.createTree(tree.root,1,tree.n,0);
    return in;
}

int TreeNode::axis = 0;

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

TreeNode::~TreeNode()
{

}


void BinaryDimonTree:: createTree(TreeNode*& cur, int lIdx ,int rIdx, int axis){
    if (lIdx>rIdx) return ;
    TreeNode::axis = axis;
    int p =(rIdx+lIdx)/2;
    cur = &array[p];
    nth_element(array+lIdx, array + p,array+rIdx+1);
    createTree(cur->ch[0], lIdx, p-1, axis^1);
    createTree(cur->ch[1], p+1, rIdx, axis^1);
}


BinaryDimonTree::~BinaryDimonTree()
{
    delete[] array;
    array = nullptr;
}

TreeNode * BinaryDimonTree::find_nearest_node(int x, int y){
    long long int min_distance = LLONG_MAX;
    TreeNode *guess;
    long long int a[2] ;
    a[0]=x;a[1]=y;
    recur_search(root, a, min_distance, guess, 0);
    return guess;
}

long long int BinaryDimonTree:: Dist(TreeNode *a,long long int x,long long int y){
    if (a==NULL) {
        return LLONG_MAX;
    }
    long long int d = pow((x- a->data[0]),2)+pow((y- a->data[1]),2);
    return d;
}



bool BinaryDimonTree::less(TreeNode *a,TreeNode *g,long long int d,long long int minD){
    if (d < minD)return 1;
    else if (d == minD) {
        if (a->getX()<g->getX())return 1;
        else if (a->getX() == g->getX()){
            if (a->getY()<g->getY())return 1;
        }
    }
    return 0;
}

void BinaryDimonTree::recur_search(TreeNode *cur, long long int target[], long long int &min_distance, TreeNode *&guess,int axis){
    if (cur ==nullptr) return;
    long long int d = Dist(cur,target[0],target[1]);
    if (less(cur,guess,d,min_distance)) {
        min_distance = d;
        guess = cur;
    }
    recur_search(cur->ch[target[axis]>=(cur->data[axis])], target, min_distance, guess, axis^1);
    long long int verticle = pow(fabs(cur->data[axis]- target[axis]),2);
    if (verticle<min_distance) {
        recur_search(cur->ch[target[axis]<(cur->data[axis])], target, min_distance, guess, axis^1);
    }
}


BinaryDimonTree::BinaryDimonTree()
{
    array = nullptr;
    root = nullptr;
}







