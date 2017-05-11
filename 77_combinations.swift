/*
Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

For example,
If n = 4 and k = 2, a solution is:

[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]
 */

class Solution {
    func combine(_ l: Int, _ r: Int, _ k: Int) -> [[Int]] {
        if r - l + 1 == k { return [[Int](l...r)] }
        
        if k == 1 {
            var res = [[Int]](repeating: [Int](), count: r - l + 1)
            for i in 0 ... r - l {
                res[i] = [i + l]
            }
            return res
        }
        
        var c1 = combine(l + 1, r, k - 1)
        var c2 = combine(l + 1, r, k)
        
        for i in 0 ..< c1.count {
            c1[i].insert(l, at: 0)
        }
        
        return c1 + c2
    }

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if k > n || n < 1 { return [[Int]]() }
        return combine(1, n, k)
    }
}