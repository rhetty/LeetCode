/*
Follow up for "Search in Rotated Sorted Array":
What if duplicates are allowed?

Would this affect the run-time complexity? How and why?
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

Write a function to determine if a given target is in the array.

The array may contain duplicates.

思路：先找到 Pivot
 */

class Solution {
    func search(_ nums: [Int], _ target: Int, _ l: Int, _ r: Int, _ pivot: Int) -> Bool {
        if l > r { return false }
        
        let m = (l + r) >> 1
        
        if nums[m] == target {
            return true
        } else if m < pivot {
            if target >= nums[l] && target <= nums[m] {
                return search(nums, target, l, m - 1, pivot)
            } else {
                return search(nums, target, m + 1, r, pivot)
            }
        } else {
            if target >= nums[m] && target <= nums[r] {
                return search(nums, target, m + 1, r, pivot)
            } else {
                return search(nums, target, l, m - 1, pivot)
            }
        }
    }

    func search(_ nums: [Int], _ target: Int) -> Bool {
        var pivot = 0
        if nums.count > 1 {
            for i in 1 ..< nums.count {
                if nums[i] < nums[i - 1] {
                    pivot = i
                    break
                }
            }
        }
        return search(nums, target, 0, nums.count - 1, pivot)
    }
}