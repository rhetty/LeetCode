/*
Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

The replacement must be in-place, do not allocate extra memory.

Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1
 */

class Solution {
    func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        let tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    }
    
    func reverse(_ nums: inout [Int], _ l: Int, _ r: Int) {
        var i = l
        var j = r
        
        while j > i {
            swap(&nums, i, j)
            i += 1
            j -= 1
        }
    }

    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        var p = -1
        var c = -1
        
        var i = n - 2
        while i >= 0 && nums[i] >= nums[i + 1] {
            i = i - 1
        }
        p = i
        
        if p >= 0 {
            i = n - 1
            while nums[i] <= nums[p] {
                i -= 1
            }
            c = i
            
            swap(&nums, p, c)
            reverse(&nums, p + 1, n - 1)
        } else {
            reverse(&nums, 0, n - 1)
        }
    }
}