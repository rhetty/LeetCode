/*
Given a set of distinct integers, nums, return all possible subsets.

Note: The solution set must not contain duplicate subsets.

For example,
If nums = [1,2,3], a solution is:

[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]

思路：基于上一题求组合的方式，分别求出数组1-n个数的组合，组成子集合。还有一个空集。
 */

class Solution {
    func combine(_ nums: [Int], _ p: Int, _ k: Int) -> [[Int]] {
        if nums.count - p == k {
            var res = [Int](repeating: 0, count: nums.count - p)
            for i in 0 ..< nums.count - p {
                res[i] = nums[i + p]
            }
            return [res]
        }
        
        if k == 1 {
            var res = [[Int]](repeating: [Int](), count: nums.count - p)
            for i in 0 ..< nums.count - p {
                res[i] = [nums[i + p]]
            }
            return res
        }
        
        var c1 = combine(nums, p + 1, k - 1)
        var c2 = combine(nums, p + 1, k)
        
        for i in 0 ..< c1.count {
            c1[i].insert(nums[p], at: 0)
        }
        
        return c1 + c2
    }

    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = [[]]
        
        if !nums.isEmpty {
            for i in 1 ... nums.count {
                res += combine(nums, 0, i)
            }
        }
        
        return res
    }
}