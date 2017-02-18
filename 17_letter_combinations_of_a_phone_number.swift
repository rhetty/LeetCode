/*
Given a digit string, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below.



Input:Digit string "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

递归
 */

class Solution {
  let map:[Character: Array<Character>]
  var chars:[Character]

  init() {
    map = ["1":["1"], "2":["a","b","c"], "3":["d","e","f"], "4":["g","h","i"], "5":["j","k","l"], "6":["m","n","o"], "7":["p","q","r","s"], "8":["t","u","v"], "9":["w","x","y","z"]]
    chars = [Character]()
  }

  func form(_ result: inout [String], _ str: String, _ i: Int) {
    if i == chars.count {
      result.append(str)
      return
    }
    for c in map[chars[i]]! {
      var s = str
      s.append(c)
      form(&result, s, i + 1)
    }
  }

  func letterCombinations(_ digits: String) -> [String] {
    chars = [Character](digits.characters)
    if chars.isEmpty {
      return []
    }
    var ret = [String]()

    form(&ret, "", 0)

    return ret
  }
}