/*
Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

Note: The solution set must not contain duplicate quadruplets.

For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.

A solution set is:
[
  [-1,  0, 0, 1],
  [-2, -1, 1, 2],
  [-2,  0, 0, 2]
]
 */

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var sorted = nums
        sorted.sort()
        var res = [[Int]]()
        let n = sorted.count
        
        var i = 0
        var j = 0
        var k = 0
        var l = 0
        while i < n - 3 {
            if i > 0 && sorted[i] == sorted[i - 1] {
                i += 1
                continue
            }
            
            j = i + 1
            while j < n - 2 {
                if j > i + 1 && sorted[j] == sorted[j - 1] {
                    j += 1
                    continue
                }
                
                let t = target - sorted[i] - sorted[j]
                k = j + 1
                l = n - 1
                
                while k < l {
                    let sum = sorted[k] + sorted[l]
                    if sum == t {
                        res.append([sorted[i], sorted[j], sorted[k], sorted[l]])
                        while (k < l && sorted[k] == sorted[k + 1]) {
                            k += 1
                        }
                        k += 1
                        while (k < l && sorted[l] == sorted[l - 1]) {
                            l -= 1
                        }
                        l -= 1
                    } else if sum < t {
                        k += 1
                    } else {
                        l -= 1
                    }
                }
                
                j += 1
            }
            
            i += 1
        }
        
        return res
    }
}