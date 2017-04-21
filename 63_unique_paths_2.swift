/*
Follow up for "Unique Paths":

Now consider if some obstacles are added to the grids. How many unique paths would there be?

An obstacle and empty space is marked as 1 and 0 respectively in the grid.

For example,
There is one obstacle in the middle of a 3x3 grid as illustrated below.

[
  [0,0,0],
  [0,1,0],
  [0,0,0]
]
The total number of unique paths is 2.

Note: m and n will be at most 100.
 */

class Solution {
  func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    var dp = obstacleGrid

    let m = dp.count
    let n = dp.first!.count

    for i in 0 ..< m {
      for j in 0 ..< n {
        if i == 0 && j == 0 {
          dp[i][j] = 1 - obstacleGrid[i][j]
        } else if i == 0 {
          dp[i][j] = obstacleGrid[i][j] == 1 ? 0 : dp[i][j - 1]
        } else if j == 0 {
          dp[i][j] = obstacleGrid[i][j] == 1 ? 0 : dp[i - 1][j]
        } else {
          dp[i][j] = obstacleGrid[i][j] == 1 ? 0 : dp[i - 1][j] + dp[i][j - 1]
        }
      }
    }

    return dp[m - 1][n - 1]
  }
}