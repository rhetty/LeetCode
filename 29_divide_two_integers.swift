/*
Divide two integers without using multiplication, division and mod operator.

If it is overflow, return MAX_INT.
 */

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if (divisor == 0) {
            return Int(Int32.max)
        } else if (divisor == 1) {
            return dividend
        } else if (divisor == -1) {
            if Int32(dividend) == Int32.min {
                return Int(Int32.max)
            } else {
                return -dividend
            }
        }
        
        var a = abs(dividend)
        let b = abs(divisor)
        var res = 0
        
        while a >= b {
            var c = b
            var i = 0
            while a >= c {
                a -= c
                res += 1 << i
                i += 1
                c <<= 1
            }
        }
        return ((dividend ^ divisor) >> 31) == -1 ? -res : res
    }
}