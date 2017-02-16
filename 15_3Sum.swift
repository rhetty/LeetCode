/*
Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note: The solution set must not contain duplicate triplets.

For example, given array S = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]

首先将数组进行排序，选定一个数，剩余的其他数就编程2Sum问题：用两个指针从两边往中间移动，直到和符合目标
 */

class Solution {
  func quicksort(_ nums: inout [Int], _ l: Int, _ r: Int) {
    if l < r {
      let pivot = nums[l]
      var i = l
      var j = r
      while i < j {
        while nums[j] > pivot {
          j = j - 1
        }
        while i < j && nums[i] <= pivot {
          i = i + 1
        }
        if i < j {
          let tmp = nums[i]
          nums[i] = nums[j]
          nums[j] = tmp
        }
      }
      nums[l] = nums[j]
      nums[j] = pivot
      quicksort(&nums, l, j - 1)
      quicksort(&nums, j + 1, r)
    }
  }
  func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
      return []
    }
    var sort = nums
    // sort
    quicksort(&sort, 0, sort.count - 1)
    //
    var ret = [[Int]]()
    var i = 0
    var j = 0
    var k = 0

    while i < sort.count - 2 && sort[i] <= 0 {
      if i > 0 && sort[i] == sort[i - 1] {
        i = i + 1
        continue
      }
      let target = 0 - sort[i]
      j = i + 1
      k = sort.count - 1
      while j < k {
        let sum = sort[j] + sort[k]
        if sum == target {
          ret.append([sort[i], sort[j], sort[k]])
          while j < k && sort[j] == sort[j + 1] {
            j = j + 1
          }
          j = j + 1
          while j < k && sort[k] == sort[k - 1] {
            k = k - 1
          }
          k = k - 1
        } else if sum < target {
          j = j + 1
        } else {
          k = k - 1
        }
      }
      i = i + 1
    }
    return ret
  }
}