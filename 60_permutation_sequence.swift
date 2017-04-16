/*
The set [1,2,3,…,n] contains a total of n! unique permutations.

By listing and labeling all of the permutations in order,
We get the following sequence (ie, for n = 3):

"123"
"132"
"213"
"231"
"312"
"321"
Given n and k, return the kth permutation sequence.

Note: Given n will be between 1 and 9 inclusive.
 */

class Solution {
  let factorials: [Int] = [0, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

  func getPermutation(_ digits: [Int], _ k: Int) -> String {
    if digits.count == 1 { return String(digits.first!) }

    let idx = (k - 1) / factorials[digits.count - 1]
    let startNum = digits[idx]

    var nDigits = digits
    nDigits.remove(at: idx)
    return String(startNum) + getPermutation(nDigits, k - idx * factorials[digits.count - 1])
  }

  func getPermutation(_ n: Int, _ k: Int) -> String {
    var digits = [Int](repeating: 0, count: n)
    for i in 0 ..< n {
      digits[i] = i + 1
    }

    return getPermutation(digits, k)
  }
}