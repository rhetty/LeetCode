/**
Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.

方法：从两边往里遍历：先固定左边指针在最左，右边指针从最右向左移动，如果遇到高度大于之前计算的高度，则计算容量。右指针遇到左指针后，则移动左指针，遇到高度大于之前的高度时，重新从最右开始移动右指针。
原理：当容器宽度变小时，只有某一条高大于之前的高度，才可能使容量增加。
 */

class Solution {
  func maxArea(_ height: [Int]) -> Int {
    var tmp = 0
    var max = 0
    var piHeight = -1
    var pjHeight = 0
    var j = 0

    for i in 0 ..< height.count - 1 {
      if height[i] > piHeight {
        piHeight = height[i]

        j = height.count - 1
        pjHeight = -1

        while j > i {
          if height[j] > pjHeight {
            pjHeight = height[j]

            tmp = (j - i) * min(piHeight, pjHeight)
            if tmp > max {
              max = tmp
            }
          }
          j = j - 1
        }
      }
    }
    return max
  }
}