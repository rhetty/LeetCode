/*
Given an array with n objects colored red, white or blue, sort them so that objects of the same color are adjacent, with the colors in the order red, white and blue.

Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

Note:
You are not suppose to use the library's sort function for this problem.

思路：基于快排的分割思想，先将0放到最左边，然后对右边的1和2在分割，时间复杂度为O(n)
 */

class Solution {
    func partition(_ nums: inout [Int], _ l: Int, _ r: Int, _ pivot: Int) -> Int {
        if l > r { return -1 }
        
        var i = l
        var j = r
        
        while i < j {
            while i <= r && nums[i] <= pivot {
                i += 1
            }
            while j >= l && nums[j] > pivot {
                j -= 1
            }
            if i < j {
                let tmp = nums[i]
                nums[i] = nums[j]
                nums[j] = tmp
            }
        }
        
        return i
    }

    func sortColors(_ nums: inout [Int]) {
        let zeroCount = partition(&nums, 0, nums.count - 1, 0)
        partition(&nums, zeroCount, nums.count - 1, 1)
    }
}