/*
Implement pow(x, n).
 */

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        if x == 0 {
            return 0
        }
        
        var res = x
        var i = 1.0
        let m = Double(abs(n))
        while i * 1.5 < m {
            res *= res
            i *= 2
        }
        if m > i {
            for j in 0 ..< Int(m - i) {
                res *= x
            }
        } else {
            for j in 0 ..< Int(i - m) {
                res /= x
            }
        }

        return n > 0 ? res : (1.0 / res)
    }
}