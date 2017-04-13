/*
Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Determine if you are able to reach the last index.

For example:
A = [2,3,1,1,4], return true.

A = [3,2,1,0,4], return false.
 */

class Solution {
  func canJump(_ nums: [Int]) -> Bool {
    if nums.isEmpty {
      return true
    }

    var dp = [Bool](repeating: false, count: nums.count)

    dp[dp.count - 1] = true
    
    for i in (0 ..< nums.count - 1).reversed() {
      if i + nums[i] >= nums.count - 1 {
        dp[i] = true
        continue
      }

      if nums[i] <= nums[i + 1] + 1{
        if !dp[i + 1] {
          dp[i] = false
        } else {
          dp[i] = nums[i] > 0
        }
        continue
      }

      if nums[i] > nums[i + 1] + 1 {
        if dp[i + 1] {
          dp[i] = true
        } else {
          for j in i + 1 + nums[i + 1] + 1 ... i + nums[i] {
            if dp[j] {
              dp[i] = true
              break
            }
          }
        }
        continue
      }
    }

    return dp[0]
  }
}