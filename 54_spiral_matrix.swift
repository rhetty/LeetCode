/*
Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

For example,
Given the following matrix:

[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
You should return [1,2,3,6,9,8,7,4,5].
 */

class Solution {
  func spiralOrder(_ matrix: [[Int]], _ offset: Int) -> [Int] {
    var res = [Int]()

    let rowCount = matrix.count - offset * 2
    let colCount = matrix.first!.count - offset * 2

    if colCount > 0 {
      for i in offset ..< offset + colCount {
        res.append(matrix[offset][i])
      }
    }

    if rowCount > 1 {
      for i in offset + 1 ..< offset + rowCount {
        res.append(matrix[i][offset + colCount - 1])
      }
    }

    if colCount > 1 && rowCount > 1 {
      for i in (offset ..< offset + colCount - 1).reversed() {
        res.append(matrix[offset + rowCount - 1][i])
      }
    }

    if rowCount > 2 && colCount > 1 {
      for i in (offset + 1 ..< offset + rowCount - 1).reversed() {
        res.append(matrix[i][offset])
      }
    }

    return res
  }

  func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    if matrix.isEmpty {
      return [Int]()
    }

    var res = [Int]()

    let n = min(matrix.count, matrix.first!.count)
    for i in 0 ..< Int(ceil(Double(n) / 2.0)) {
      res += spiralOrder(matrix, i)
    }

    return res
  }
}