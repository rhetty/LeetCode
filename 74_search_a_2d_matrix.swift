/*
Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

Integers in each row are sorted from left to right.
The first integer of each row is greater than the last integer of the previous row.
For example,

Consider the following matrix:

[
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
Given target = 3, return true.
 */

class Solution {
    func binarySearch(_ a: [Int], _ target: Int, _ l: Int, _ r: Int) -> Bool {
        if l > r { return false }
        
        let m = (l + r) / 2
        
        if target < a[m] {
            return binarySearch(a, target, l, m - 1)
        } else if target > a[m] {
            return binarySearch(a, target, m + 1, r)
        } else {
            return true
        }
    }

    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        if m == 0 { return false }
        let n = matrix.first!.count
        if n == 0 { return false }
        
        for i in 0 ..< m {
            if target < matrix[i].first! {
                if i == 0 {
                    return false
                } else {
                    return binarySearch(matrix[i - 1], target, 0, n - 1)
                }
            } else if target == matrix[i].first! {
                return true
            }
        }
        
        let last = matrix.last!.last!
        
        if target < last {
            return binarySearch(matrix.last!, target, 0, n - 1)
        } else {
            return target == last
        }
    }
}