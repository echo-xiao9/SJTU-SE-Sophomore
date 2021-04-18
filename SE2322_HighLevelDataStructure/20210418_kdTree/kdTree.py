from typing import List
from scipy.spatial import KDTree

def findNeighbors(point: List[int], set: List[List[int]], k: int) -> List[List[int]]:
       pass  # Your implementation
       tree=KDTree(set)
       result, indexArray=tree.query(point, k)
       resultArray=[]
       for index in range(k):
              resultArray.append(set[indexArray[index]])

       return resultArray

def main():
    print(findNeighbors([1,3,2],[[1,-2,-2],[1,-3,-3],[1,2,4],[1,4,3],[2,1,4]], 3))

main()
