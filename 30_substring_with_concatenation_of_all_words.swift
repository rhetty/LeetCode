/*
You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.

For example, given:
s: "barfoothefoobarman"
words: ["foo", "bar"]

You should return the indices: [0,9].
(order does not matter).

心好累
 */

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let n = words.first!.characters.count
        let m = n * words.count
        let chars = [Character](s.characters)

        var res = [Int]()
        var p = 0
        
        for l in 0 ..< n {
            var b = l
            p = l
            var count = words.count
            
            var map = [String: Int]()
        
            for w in words {
                if map[w] != nil {
                    map[w] = map[w]! + 1
                } else {
                    map[w] = 1
                }
            }
            
            while b <= chars.count - m {
                var k = test(chars, offset: p, map: &map, n: n, count: count)
                if k == p && count == words.count {
                    b += n
                    p = b
                } else {
                    if k == b + m {
                        res.append(b)
                    }
                    
                    let w = String(chars[b ..< b + n])
                    map[w] = map[w]! + 1
                    p = k
                    b += n
                    count = words.count - (p - b) / n
                }
            }
        }
        
        return res
    }
    
    func test(_ chars: [Character], offset: Int, map: inout [String: Int], n: Int, count: Int) -> Int {
        var p = offset
        
        for i in 0 ..< count {
            let w = String(chars[p ..< p + n])
            
            if map[w] != nil && map[w]! > 0 {
                p += n
                map[w] = map[w]! - 1
            } else {
                break
            }
        }
        
        return p
    }
}