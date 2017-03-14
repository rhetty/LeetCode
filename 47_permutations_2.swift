/*
Given a collection of numbers that might contain duplicates, return all possible unique permutations.

For example,
[1,1,2] have the following unique permutations:
[
  [1,1,2],
  [1,2,1],
  [2,1,1]
]
 */

class Solution {
    func permute(_ nums: [Int], _ visited: [Bool], _ p: [Int], _ res: inout [[Int]]) {
        if p.count == nums.count {
            res.append(p)
            return
        }
        
        var appended = Set<Int>()
        for i in 0 ..< nums.count {
            if !visited[i] && !appended.contains(nums[i]) {
                appended.insert(nums[i])
                var v2 = visited
                var tp = p
                tp.append(nums[i])
                v2[i] = true
                permute(nums, v2, tp, &res)
            }
        }
    }

    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var visited = [Bool](repeating: false, count: nums.count)
        var res = [[Int]]()
        permute(nums, visited, [Int](), &res)
        return res
    }
}