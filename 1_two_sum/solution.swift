class Solution {
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let iSubs = 0 ..< nums.count - 1
    for i in iSubs {
      let jSubs = i + 1 ..< nums.count
      for j in jSubs {
        if nums[i] + nums[j] == target {
        	return [i, j]
        }
      }
    }
    return []
  }
}