/*
Implement wildcard pattern matching with support for '?' and '*'.

'?' Matches any single character.
'*' Matches any sequence of characters (including the empty sequence).

The matching should cover the entire input string (not partial).

The function prototype should be:
bool isMatch(const char *s, const char *p)

Some examples:
isMatch("aa","a") → false
isMatch("aa","aa") → true
isMatch("aaa","aa") → false
isMatch("aa", "*") → true
isMatch("aa", "a*") → true
isMatch("ab", "?*") → true
isMatch("aab", "c*a*b") → false
 */

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let ss = [Character](s.characters)
        let ps = [Character](p.characters)
        var star = -1;
        var matchS = 0;
        var i = 0;
        var j = 0;
        
        while i < ss.count {
            if j < ps.count && (ps[j] == "?" || ss[i] == ps[j]) {
                i += 1
                j += 1
            } else if j < ps.count && ps[j] == "*" {
                star = j
                j += 1
                matchS = i
            } else if star != -1 {
                j = star + 1
                matchS += 1
                i = matchS
            } else {
                return false
            }
        }
        
        while j < ps.count {
            if ps[j] != "*" {
                return false
            }
            j += 1
        }
        
        return true
    }
}