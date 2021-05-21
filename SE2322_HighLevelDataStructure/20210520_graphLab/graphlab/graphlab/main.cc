//
//  main.cpp
//  graphlab
//
//  Created by 康艺潇 on 2021/5/20.
//

#include <iostream>
#include <list>
#include <vector>
#include <queue>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Program to find Dijkstra's shortest path using
// priority_queue in STL
using namespace std;
# define INF 0x3f3f3f3f
//const int maxVertices=200000;
// iPair ==> Integer Pair
typedef pair<int, int> iPair;

// This class represents a directed graph using
// adjacency list representation
class Graph
{
    int V; // No. of vertices
    // In a weighted graph, we need to store vertex
    // and weight pair for every edge
    list< pair<int, int> > *adj;
    
    
    int* bewteenVec; // The number of the ith node in the shortest path of the other nodes
public:
    Graph(int V); // Constructor
    
    // function to add an edge to graph
    void addEdge(int u, int v, int w);
    
    // prints shortest path from s
    double shortestPath(int src,vector<int> &dist);
    void getMaxDegreeCentrality(int &maxDegreeCentrality, int &maxDegreeCentralityIndex);
    void BetweennessCentrality(
                               int &maxBetweennessCentrality,
                               int &maxBetweennessCentralityIndex);
    void getClosenessCentrality(double &maxClosenessCentrality,
                                int &maxClosenessCentralityIndex);
};

// Allocates memory for adjacency list
Graph::Graph(int V)
{
    this->V = V;
    adj = new list<iPair> [V];
    bewteenVec = new int[V+5];
    for(int i=0;i<V+5;i++)bewteenVec[i]=0;
    
}

void Graph::addEdge(int u, int v, int w)
{
    adj[u].push_back(make_pair(v, w));
    adj[v].push_back(make_pair(u, w));
}

// Prints shortest paths from src to all other vertices
double Graph::shortestPath(int src,vector<int> &dist)
{
    // Create a priority queue to store vertices that
    // are being preprocessed. This is weird syntax in C++.
    priority_queue< iPair, vector <iPair> , greater<iPair> > pq;
    int lastNode=0;
    int v=0;int tmp=0;
    
    int *father = new int[V+5];
    for(int i=0;i<V+5;i++)father[i]=-1;
    // Create a vector for distances and initialize all
    // distances as infinite (INF)
    //    vector<int> dist(V, INF);
//    cout<<"src:"<<src<<endl;
    // Insert source itself in priority queue and initialize
    // its distance as 0.
    pq.push(make_pair(0, src));
    dist[src] = 0;
    
    /* Looping till priority queue becomes empty (or all
     distances are not finalized) */
    while (!pq.empty())
    {
        // The first vertex in pair is the minimum distance
        // vertex, extract it from priority queue.
        // vertex label is stored in second of pair (it
        // has to be done this way to keep the vertices
        // sorted distance (distance must be first item
        // in pair)
        int u = pq.top().second;
        pq.pop();
        
        // 'i' is used to get all adjacent vertices of a vertex
        list< pair<int, int> >::iterator i;
        for (i = adj[u].begin(); i != adj[u].end(); ++i)
        {
            // Get vertex label and weight of current adjacent
            // of u.
            v = (*i).first;
            int weight = (*i).second;
            
            // If there is shorted path to v through u.
            if (dist[v] > dist[u] + weight)
            {
//                cout<<"src:"<<src<<" u:"<<u<<" v:"<<v<<endl;
                // Updating distance of v
                dist[v] = dist[u] + weight;
                father[v]=u;
                pq.push(make_pair(dist[v], v));
                lastNode = u;
            }
        }
        
        }
    for(int i=0;i<V;i++){
        tmp=father[i];
        while (tmp!=-1 && father[tmp]!= -1) {
            bewteenVec[tmp]++;
            tmp=father[tmp];
        }
    }
    
    // Print shortest distances stored in dist[]
    int sumDist=0;
    for (int i = 0; i < V; ++i){
        sumDist+=dist[i];
    }
    //        printf("%d \t\t %d\n", i, dist[i]);
    return sumDist;
}

void Graph::getMaxDegreeCentrality(int &maxDegreeCentrality, int &maxDegreeCentralityIndex){
    int maxDegree=0;
    int maxDegreeIndex=0;
    for(int i=0;i<V;i++){
        int size = adj[i].size();
        if(size>maxDegree){
            maxDegree = size;
            maxDegreeIndex= i;
        }
    }
    maxDegreeCentrality = maxDegree;
    maxDegreeCentralityIndex = maxDegreeIndex;
}

void Graph::BetweennessCentrality(
                                  int &maxBetweennessCentrality,
                                  int &maxBetweennessCentralityIndex){
    
    for(int i=0;i<V;i++){
        if(bewteenVec[i]>maxBetweennessCentrality){
            maxBetweennessCentrality=bewteenVec[i];
            maxBetweennessCentralityIndex = i;
        }
    }
    maxBetweennessCentrality/=2;
    
}

void Graph::getClosenessCentrality(double &maxClosenessCentrality,
                                   int &maxClosenessCentralityIndex){
    vector<int>sumDist;
    int minDistIndex=0;
    int minDist=INF;
    for(int i=0;i<V;i++){
        vector<int> dist(V, INF);
        sumDist.push_back(shortestPath(i,dist));
    }
    for(int i=0;i<sumDist.size();i++){
        if(minDist> sumDist[i]){
            minDist=sumDist[i];
            minDistIndex = i;
        }
    }
    maxClosenessCentralityIndex = minDistIndex;
    maxClosenessCentrality = float(float(V-1)/float(minDist));
}

// Driver program to test methods of graph class
int main(int argc, char* argv[])
{
    ifstream infile;
    int n=0;
    infile.open(argv[1]);
//    infile.open("test.TXT");
    int maxDegreeCentrality=0, maxDegreeCentralityIndex=0;
    double maxClosenessCentrality=INF;
    int maxClosenessCentralityIndex=0;
    int maxBetweennessCentralityIndex=0,maxBetweennessCentrality=0;
    /* 节点总数 */
    infile >> n;
//    cout<<n<<endl;
    Graph g(n);
    char* line = new char[n];
    int64_t v1, v2, weight;
    while (infile >> line) {
        
//        cout<<line<<endl;
        // cout << line << endl;
        char *p = strtok(line, ",");
        v1 = atoi(p);
        p = strtok(NULL, ",");
        v2 = atoi(p);
        p = strtok(NULL, ",");
        weight = atoi(p);
        g.addEdge(v1, v2, weight);
    }
    g.getMaxDegreeCentrality(maxDegreeCentrality, maxDegreeCentralityIndex);
    cout<<maxDegreeCentralityIndex<< ' '<<maxDegreeCentrality<<endl;
    g.getClosenessCentrality(maxClosenessCentrality, maxClosenessCentralityIndex);
    cout<<maxClosenessCentralityIndex<< ' '<<maxClosenessCentrality<<endl;
    g.BetweennessCentrality(maxBetweennessCentrality, maxBetweennessCentralityIndex);
    cout<<maxBetweennessCentralityIndex<<' '<<maxBetweennessCentrality<<endl;
    return 0;
}

