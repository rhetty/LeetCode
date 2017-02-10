/**
Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You may assume no duplicates in the array.

Here are few examples.
[1,3,5,6], 5 → 2
[1,3,5,6], 2 → 1
[1,3,5,6], 7 → 4
[1,3,5,6], 0 → 0
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        for i in 0 ..< nums.count {
        	if nums[i] >= target {
        		return i
        	}
        }
        return nums.count
    }
}