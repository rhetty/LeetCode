/*
Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.
 */

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var dp = grid
        let m = dp.count
        let n = dp.first!.count
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                if i == 0  && j == 0 {
                    dp[i][j] = grid[i][j]
                } else if i == 0 {
                    dp[i][j] = dp[i][j - 1] + grid[i][j]
                } else if j == 0 {
                    dp[i][j] = dp[i - 1][j] + grid[i][j]
                } else {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j]
                }
            }
        }
        
        return dp[m - 1][n - 1]
    }
}