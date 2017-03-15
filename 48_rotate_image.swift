/*
You are given an n x n 2D matrix representing an image.

Rotate the image by 90 degrees (clockwise).

Follow up:
Could you do this in-place?

思路：先根据反对角线进行翻转，然后上下翻转。
 */

class Solution {
    func step1(_ matrix: inout [[Int]]) {
        for i in 0 ..< matrix.count - 1 {
            for j in 0 ..< matrix.count - i - 1 {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[matrix.count - j - 1][matrix.count - i - 1]
                matrix[matrix.count - j - 1][matrix.count - i - 1] = tmp
            }
        }
    }
    
    func step2(_ matrix: inout [[Int]]) {
        for i in 0 ..< matrix.count / 2 {
            for j in 0 ..< matrix.count {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[matrix.count - i - 1][j]
                matrix[matrix.count - i - 1][j] = tmp
            }
        }
    }

    func rotate(_ matrix: inout [[Int]]) {
        step1(&matrix)
        step2(&matrix)
    }
}