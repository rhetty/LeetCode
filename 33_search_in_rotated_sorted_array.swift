/*
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.

主要思想：二分法。如果最左边小于中间，则左半边是有序的；否则右半边是有序的。再检查 target 是否在有序的半边，递归使用二分法。
 */

class Solution {
    func search(_ nums:[Int], _ target: Int, _ l: Int, _ r: Int) -> Int {
        if l > r {
            return -1
        }
        
        let m = (l + r) / 2
        if nums[m] == target {
            return m
        } else if nums[l] <= nums[m] {
            if target >= nums[l] && target <= nums[m] {
                return search(nums, target, l, m - 1)
            } else {
                return search(nums, target, m + 1, r)
            }
        } else {
            if target >= nums[m] && target <= nums[r] {
                return search(nums, target, m + 1, r)
            } else {
                return search(nums ,target, l, m - 1)
            }
        }
    }

    func search(_ nums: [Int], _ target: Int) -> Int {
        return search(nums, target, 0, nums.count - 1)
    }
}