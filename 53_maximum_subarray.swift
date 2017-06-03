/*
Find the contiguous subarray within an array (containing at least one number) which has the largest sum.

For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var max = Int.min
        var sum = 0
        
        for num in nums {
            sum += num
            if sum > max {
                max = sum
            }
            if sum < 0 {
                sum = 0
            }
        }
        
        return max
    }
}