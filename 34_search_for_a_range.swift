/*
Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.

Your algorithm's runtime complexity must be in the order of O(log n).

If the target is not found in the array, return [-1, -1].

For example,
Given [5, 7, 7, 8, 8, 10] and target value 8,
return [3, 4].
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int, _ l: Int, _ r: Int) -> [Int] {
        if l > r {
            return [-1, -1]
        }
        
        let m = (l + r) / 2
        if nums[m] == target {
            let leftRange = searchRange(nums, target, l, m - 1)
            let rightRange = searchRange(nums, target, m + 1, r)
            let left = leftRange[0] == -1 ? m : leftRange[0]
            let right = rightRange[1] == -1 ? m : rightRange[1]
            return [left, right]
        } else if nums[m] > target {
            return searchRange(nums, target, l, m - 1)
        } else {
            return searchRange(nums, target, m + 1, r)
        }
    }

    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return searchRange(nums, target, 0, nums.count - 1)
    }
}