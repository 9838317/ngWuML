%在matlab中，假如输入是一个矩阵的话，比如 structure = dimention * datapoints, 这个时候max可以对单个轴求max，不仅仅可以求得这个axis的max值，而且可以求得它的位置，用法是：

    [a, b] = max(matrix, 1/2);
