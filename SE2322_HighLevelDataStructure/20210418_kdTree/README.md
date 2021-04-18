# kd-tree

# 源代码和作业要求

```python
from typing import List

# 完成findNeighbors函数(python3),使得该函数返回距离点@point最近的前@k个点,并分析其时间复杂度
# 分析时间复杂度时,基于变量n和k,其中 n = len(set)
# 提示:使用scipy库的kd-tree实现

# @point:一个len(point)维空间的点

# @set: 一个len(point)维空间中的点集

# @k: 寻找距离@point最近的@k个点

def findNeighbors(point: List[int], set: List[List[int]], k: int) -> List[List[int]]:
    pass # Your implementation

def main():
    print(findNeighbors([1,3,2],[[1,-2,-2],[1,-3,-3],[1,2,4],[1,4,3],[2,1,4]], 3))

main()

# 输出应当是[[1, 4, 3], [1, 2, 4], [2, 1, 4]] 这个列表中的内容,不要求顺序一样.请运行比对并提供截图
```

最近邻搜索用scipy函数的kdtree. query函数

分析复杂度：一定要看代码的话可以看 ckdtree [https://github.com/scipy/scipy/blob/master/scipy/spatial/ckdtree/src/query.cxx#L191](https://github.com/scipy/scipy/blob/master/scipy/spatial/ckdtree/src/query.cxx#L191)

KDTree声明在https://github.com/scipy/scipy/blob/master/scipy/spatial/kdtree.py#L182，继承自cKDTree。Python本来就是可以调用其它语言的库的

复杂度分析：

[https://towardsdatascience.com/k-nearest-neighbors-computational-complexity-502d2c440d5](https://towardsdatascience.com/k-nearest-neighbors-computational-complexity-502d2c440d5)

# query

query第一个返回值是一个表示结果点到搜索点距离的数组，第二个返回值表示结果点在原本的点集中的序号

用第二个返回值在原数组把目标点找出来就行

[scipy/scipy](https://github.com/scipy/scipy/blob/master/scipy/spatial/kdtree.py#L182)

```cpp
 def query(
            self, x, k=1, eps=0, p=2, distance_upper_bound=np.inf, workers=1):
        """Query the kd-tree for nearest neighbors

        Parameters
        ----------
        x : array_like, last dimension self.m
            An array of points to query.
        k : int or Sequence[int], optional
            Either the number of nearest neighbors to return, or a list of the
            k-th nearest neighbors to return, starting from 1.
        eps : nonnegative float, optional
            Return approximate nearest neighbors; the kth returned value
            is guaranteed to be no further than (1+eps) times the
            distance to the real kth nearest neighbor.
        p : float, 1<=p<=infinity, optional
            Which Minkowski p-norm to use.
            1 is the sum-of-absolute-values "Manhattan" distance
            2 is the usual Euclidean distance
            infinity is the maximum-coordinate-difference distance
            A large, finite p may cause a ValueError if overflow can occur.
        distance_upper_bound : nonnegative float, optional
            Return only neighbors within this distance. This is used to prune
            tree searches, so if you are doing a series of nearest-neighbor
            queries, it may help to supply the distance to the nearest neighbor
            of the most recent point.
        workers : int, optional
            Number of workers to use for parallel processing. If -1 is given
            all CPU threads are used. Default: 1.

            .. versionadded:: 1.6.0

        Returns
        -------
        d : float or array of floats
            The distances to the nearest neighbors.
            If ``x`` has shape ``tuple+(self.m,)``, then ``d`` has shape
            ``tuple+(k,)``.
            When k == 1, the last dimension of the output is squeezed.
            Missing neighbors are indicated with infinite distances.
            Hits are sorted by distance (nearest first).

            .. deprecated:: 1.6.0
               If ``k=None``, then ``d`` is an object array of shape ``tuple``,
               containing lists of distances. This behavior is deprecated and
               will be removed in SciPy 1.8.0, use ``query_ball_point``
               instead.

        i : integer or array of integers
            The index of each neighbor in ``self.data``.
            ``i`` is the same shape as d.
            Missing neighbors are indicated with ``self.n``.

        Examples
        --------

        >>> import numpy as np
        >>> from scipy.spatial import KDTree
        >>> x, y = np.mgrid[0:5, 2:8]
        >>> tree = KDTree(np.c_[x.ravel(), y.ravel()])

        To query the nearest neighbours and return squeezed result, use

        >>> dd, ii = tree.query([[0, 0], [2.1, 2.9]], k=1)
        >>> print(dd, ii)
        [2.         0.14142136] [ 0 13]

        To query the nearest neighbours and return unsqueezed result, use

        >>> dd, ii = tree.query([[0, 0], [2.1, 2.9]], k=[1])
        >>> print(dd, ii)
        [[2.        ]
         [0.14142136]] [[ 0]
         [13]]

        To query the second nearest neighbours and return unsqueezed result,
        use

        >>> dd, ii = tree.query([[0, 0], [2.1, 2.9]], k=[2])
        >>> print(dd, ii)
        [[2.23606798]
         [0.90553851]] [[ 6]
         [12]]

        To query the first and second nearest neighbours, use

        >>> dd, ii = tree.query([[0, 0], [2.1, 2.9]], k=2)
        >>> print(dd, ii)
        [[2.         2.23606798]
         [0.14142136 0.90553851]] [[ 0  6]
         [13 12]]

        or, be more specific

        >>> dd, ii = tree.query([[0, 0], [2.1, 2.9]], k=[1, 2])
        >>> print(dd, ii)
        [[2.         2.23606798]
         [0.14142136 0.90553851]] [[ 0  6]
         [13 12]]

        """
```

# kdTree

```python
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
```

结果

![kd-tree%203f020729ba5b42b59560e3878c55e7d6/2021-04-18_10.56.12.png](kd-tree%203f020729ba5b42b59560e3878c55e7d6/2021-04-18_10.56.12.png)

# 时间复杂度分析

构造kdTree **时间复杂度：** `O(d * n * log(n))`

得到最近点的集合时间复杂度**:** `O(k * log(n))`

构造一棵d维的kdTree 的时间复杂度为O(d*n*log(n)), kdTree支持查找最近的点，每次查找后把这个点从集合中删去，每次查找的时间复杂度为：O(log(n)),所以总时间复杂度为：O(k*log(n))

因此总的时间复杂度为`O(d * n * log(n))`+`O(k * log(n))` = `O(n*log(n))`

# 参考：

[kdtree&knn_越努力越幸运-CSDN博客](https://blog.csdn.net/u014265088/article/details/53579539)

[scipy.spatial.KDTree.query - SciPy v1.6.2 Reference Guide](https://docs.scipy.org/doc/scipy/reference/generated/scipy.spatial.KDTree.query.html)