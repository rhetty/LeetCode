/*
Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.

Each number in C may only be used once in the combination.

Note:
All numbers (including target) will be positive integers.
The solution set must not contain duplicate combinations.
For example, given candidate set [10, 1, 2, 7, 6, 1, 5] and target 8, 
A solution set is: 
[
  [1, 7],
  [1, 2, 5],
  [2, 6],
  [1, 1, 6]
]
 */

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int, _ res: inout [[Int]], _ s: [Int], _ idx: Int) {
        var cSum = 0
        for i in s {
            cSum += i
        }
        if cSum == target {
            res.append(s)
        } else if cSum > target {
            return
        } else {
            for i in idx ..< candidates.count {
                if i == idx || candidates[i] > candidates[i - 1] {
                    var ss = s
                    ss.append(candidates[i])
                    combinationSum2(candidates, target, &res, ss, i + 1)
                }
            }
        }
    }

    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var sorted = candidates
        sorted.sort(by: <)
        combinationSum2(sorted, target, &res, [Int](), 0)
        return res
    }
}