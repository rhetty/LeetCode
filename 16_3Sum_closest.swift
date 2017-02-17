/*
Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

    For example, given array S = {-1 2 1 -4}, and target = 1.

    The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
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

  func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    var ret = 0
    if nums.count <= 3 {
      for i in nums {
        ret = ret + i
      }
      return ret
    }
    var sort = nums
    // sort
    quicksort(&sort, 0, sort.count - 1)
    //
    var i = 0
    var j = 0
    var k = 0
    ret = sort[0] + sort[1] + sort[2]
    var subop = 0

    while i < sort.count - 2 {
      if i > 0 && sort[i] == sort[i - 1] {
        i = i + 1
        continue
      }
      let reverse = target - sort[i]
      j = i + 1
      k = sort.count - 1
      subop = sort[i] + sort[j] + sort[k]
      while j < k {
        let sum = sort[j] + sort[k]
        if sum == reverse {
          return target
        } else if sum < reverse {
          if reverse - sum < abs(subop - target) {
            subop = sum + sort[i]
          }
          while j < k && sort[j] == sort[j + 1] {
            j = j + 1
          }
          j = j + 1
        } else {
          if sum - reverse < abs(subop - target) {
            subop = sum + sort[i]
          }
          while j < k && sort[k] == sort[k - 1] {
            k = k - 1
          }
          k = k - 1
        }
      }
      if abs(subop - target) < abs(ret - target) {
        ret = subop
      }
      i = i + 1
    }
    return ret
  }
}