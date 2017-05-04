/*
Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in place.

Follow up:
Did you use extra space?
A straight forward solution using O(mn) space is probably a bad idea.
A simple improvement uses O(m + n) space, but still not the best solution.
Could you devise a constant space solution?

不用额外空间的思路（未实现）：遍历一次matrix，将需要置零的位置暂时写为一个非0数，假设为a。最后再遍历一次，将a都置为0。
问题：解决a与已有数字的冲突
 */

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.isEmpty { return }
        
        let m = matrix.count
        let n = matrix.first!.count
        
        var map = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                if matrix[i][j] == 0 {
                    for k in 0 ..< m {
                        map[k][j] = true
                    }
                    for k in 0 ..< n {
                        map[i][k] = true
                    }
                }
            }
        }
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                if map[i][j] {
                    matrix[i][j] = 0
                }
            }
        }
    }
}