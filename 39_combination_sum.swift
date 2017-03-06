/*
Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.

The same repeated number may be chosen from C unlimited number of times.

Note:
All numbers (including target) will be positive integers.
The solution set must not contain duplicate combinations.
For example, given candidate set [2, 3, 6, 7] and target 7, 
A solution set is: 
[
  [7],
  [2, 2, 3]
]
 */

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int, _ res: inout [[Int]], _ s: [Int]) {
        var cSum = 0
        for i in s {
            cSum += i
        }
        if cSum == target {
            res.append(s)
        } else if cSum > target {
            return
        } else {
            for c in candidates {
                if s.isEmpty || s.last! <= c {
                    var ss = s
                    ss.append(c)
                    combinationSum(candidates, target, &res, ss)
                }
            }
        }
    }

    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        combinationSum(candidates, target, &res, [Int]())
        return res
    }
}