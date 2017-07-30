/*
Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.

You may assume the integer do not contain any leading zero, except the number 0 itself.

The digits are stored such that the most significant digit is at the head of the list.
 */

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var res = digits
        let len = res.count
        var carry = 1
        
        for i in 0 ..< len
        {
            let sum = res[len - i - 1] + carry
            
            if sum > 9
            {
                res[len - i - 1] = sum % 10
                carry = sum / 10
            }
            else
            {
                res[len - i - 1] = sum
                carry = 0
            }
        }
        
        if carry > 0
        {
            res.insert(carry, at: 0)
        }
        
        return res
    }
}