/*
Given an integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.

For example,
Given n = 3,

You should return the following matrix:
[
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
]
 */

class Solution {
  func fill(_ matrix: inout [[Int]], _ offset: Int, _ start: Int) -> Int {
    let s = offset
    let f = matrix.count - 1 - offset

    if s > f { return -1 }

    var num = start

    for i in s ... f {
      matrix[s][i] = num
      num += 1
    }

    if f - s > 0 {
      for i in s + 1 ... f {
        matrix[i][f] = num
        num += 1
      }

      for i in (s ... f - 1).reversed() {
        matrix[f][i] = num
        num += 1
      }
    }

    if f - s > 1 {
      for i in (s + 1 ... f - 1).reversed() {
        matrix[i][s] = num
        num += 1
      }
    }

    return num
  }

  func generateMatrix(_ n: Int) -> [[Int]] {
    var res = [[Int]](repeating:[Int](repeating: 0, count: n), count: n)

    var start = 1
    var offset = 0
    while start <= n * n {
      start = fill(&res, offset, start)
      offset += 1
    }

    return res
  }
}