/*
Given a collection of intervals, merge all overlapping intervals.

For example,
Given [1,3],[2,6],[8,10],[15,18],
return [1,6],[8,10],[15,18].

思路：首先根据 start 字段进行升序排序，然后尝试将每项与最后一项合并。
 */

/**
 * Definition for an interval.
 * public class Interval {
 *   public var start: Int
 *   public var end: Int
 *   public init(_ start: Int, _ end: Int) {
 *     self.start = start
 *     self.end = end
 *   }
 * }
 */
class Solution {
  func merge(_ intervals: [Interval]) -> [Interval] {
    if intervals.isEmpty { return intervals }

    var sorted = intervals
    sorted.sort{ return $0.start < $1.start }

    var res = [Interval]()

    for itvl in sorted {
      if let l = res.last {
        if itvl.start <= l.end {
          if itvl.end > l.end { l.end = itvl.end }
          continue
        }
      }
      res.append(itvl)
    }

    return res
  }
}