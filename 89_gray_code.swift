/*
The gray code is a binary numeral system where two successive values differ in only one bit.

Given a non-negative integer n representing the total number of bits in the code, print the sequence of gray code. A gray code sequence must begin with 0.

For example, given n = 2, return [0,1,3,2]. Its gray code sequence is:

00 - 0
01 - 1
11 - 3
10 - 2
Note:
For a given n, a gray code sequence is not uniquely defined.

For example, [0,2,3,1] is also a valid gray code sequence according to the above definition.

For now, the judge is able to judge based on one instance of gray code sequence. Sorry about that.

思路：找规律。。后一半序列是前一半序列的最高位变为1，再逆序。
 */

class Solution {
    func grayCode(_ n: Int) -> [Int] {
        if n <= 0 { return [0] }
        if n == 1 { return [0, 1] }
        
        let pre = grayCode(n - 1)
        let count = pre.count
        let inc = Int(pow(2.0, Double(n - 1)))
        
        var post = [Int](1...count)
        for i in 0 ..< count {
            post[i] = pre[count - i - 1] + inc
        }
        
        return pre + post
    }
}