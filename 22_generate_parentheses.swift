/*
Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

For example, given n = 3, a solution set is:

[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]
 */

class Solution {
  func generate(_ l: Int, _ r: Int, _ s: String, _ res: inout [String]) {
    if l > r || l < 0 || r < 0 {
      return
    }
    if l == 0 && r == 0 {
      res.append(s)
      return
    }
    generate(l - 1, r, s + "(", &res)
    generate(l, r - 1, s + ")", &res)
  }

  func generateParenthesis(_ n: Int) -> [String] {
    var res = [String]()
    generate(n, n, "", &res)
    return res
  }
}