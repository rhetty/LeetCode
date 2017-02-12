/**
  Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

  Example:

  Input: "babad"

  Output: "bab"

  Note: "aba" is also a valid answer.
  Example:

  Input: "cbbd"

  Output: "bb"

 * 用递归写逻辑很清晰，但是重复劳动太多，用动态规划可以改善，时间复杂度为O(N^2)，还是没通过LeetCode..最后参考了网上大神 http://blog.csdn.net/hopeztm/article/details/7932245
 */

class Solution {
  func preprocess(_ s: String) -> String {
    var ret = "#"
    for c in s.characters {
      ret.append(String(c) + "#")
    }
    return ret
  }

  func longestPalindrome(_ s: String) -> String {
    var T = [Character](preprocess(s).characters)
    var P = Array(repeating: 0, count: T.count)
    var C = 1
    var R = 2

    for i in 1 ..< T.count - 1 {
      var iMirror = 2 * C - i // equals to i' = C - (i-C)  

      P[i] = R > i ? min(P[iMirror], R - i) : 0

      // Attempt to expand palindrome centered at i
      while i + 1 + P[i] < T.count && i - 1 - P[i] >= 0 && T[i + 1 + P[i]] == T[i - 1 - P[i]] {
        P[i] = P[i] + 1
      }

      // If palindrome centered at i expand past R,  
      // adjust center based on expanded palindrome.
      if i + P[i] > R {
        C = i
        R = i + P[i]
      }
    }

    // Find the maximum element in P. 
    var maxLen = 0
    var centerIdx = 0
    for i in 1 ..< T.count - 1 {
      if P[i] > maxLen {
        maxLen = P[i]
        centerIdx = i
      }
    }
    let chars = [Character](s.characters)
    let startIdx = (centerIdx + 1 - maxLen) / 2
    return String(chars[startIdx ..< startIdx + maxLen])
  }
}