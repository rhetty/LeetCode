/*
There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

Example 1:
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
Example 2:
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
 */

class Solution {
    func merge(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let m = nums1.count
        let n = nums2.count
        var res = [Int](repeating: 0, count: m + n)
        
        var i = 0
        var j = 0
        var p = 0
        while i < m && j < n {
            if nums1[i] < nums2[j] {
                res[p] = nums1[i]
                i += 1
            } else {
                res[p] = nums2[j]
                j += 1
            }
            p += 1
        }
        
        while i < m {
            res[p] = nums1[i]
            i += 1
            p += 1
        }
        
        while j < n {
            res[p] = nums2[j]
            j += 1
            p += 1
        }
        
        return res
    }

    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let sort = merge(nums1, nums2)
        let n = sort.count
        if sort.count % 2 == 0 {
            return Double(sort[n / 2 - 1] + sort[n / 2]) * 0.5
        } else {
            return Double(sort[n / 2])
        }
    }
}