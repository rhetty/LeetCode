/*
Follow up for "Remove Duplicates":
What if duplicates are allowed at most twice?

For example,
Given sorted array nums = [1,1,1,2,2,3],

Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new length.
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let n = nums.count
        if n < 3 { return n }
        
        var twice = false
        var i = 0
        for j in 1 ..< n {
            if nums[j] != nums[i] {
                twice = false
            } else {
                if twice {
                    continue
                } else {
                    twice = true
                }
            }
            i += 1
            nums[i] = nums[j]
        }
        return i + 1
    }
}