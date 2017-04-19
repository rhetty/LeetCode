/*

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?


Above is a 3 x 7 grid. How many possible unique paths are there?

Note: m and n will be at most 100.
 */

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

        for i in 0 ..< m {
          for j in 0 ..< n {
            if i == 0 || j == 0 {
              dp[i][j] = 1
            } else {
              dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
          }
        }

        return dp[m - 1][n - 1]
    }
}