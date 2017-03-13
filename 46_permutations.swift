/*
Given a collection of distinct numbers, return all possible permutations.

For example,
[1,2,3] have the following permutations:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
 */

class Solution {
    func permute(_ nums: [Int], _ visited: [Bool], _ p: [Int], _ res: inout [[Int]]) {
        if p.count == nums.count {
            res.append(p)
            return
        }
        
        for i in 0 ..< nums.count {
            if !visited[i] {
                var v2 = visited
                var tp = p
                tp.append(nums[i])
                v2[i] = true
                permute(nums, v2, tp, &res)
            }
        }
    }

    func permute(_ nums: [Int]) -> [[Int]] {
        var visited = [Bool](repeating: false, count: nums.count)
        var res = [[Int]]()
        permute(nums, visited, [Int](), &res)
        return res
    }
}