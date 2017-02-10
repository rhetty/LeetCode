/**
The count-and-say sequence is the sequence of integers beginning as follows:
1, 11, 21, 1211, 111221, ...

1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.
Given an integer n, generate the nth sequence.

Note: The sequence of integers will be represented as a string.
 */

class Solution {
    func countAndSay(_ n: Int) -> String {
        var ret = "1"
        var tmp = ""
        var p: Character
        var pCount = 0
        if n > 1 {
	        for i in 1 ..< n {
	        	tmp = ""
	        	p = "0"
	        	for c in ret.characters {
	        		if c == p {
	        			pCount = pCount + 1
	        		} else {
	        			if p != "0" {
	        				tmp += String(pCount)
	        				tmp += String(p)
	        			}
	        			p = c
	        			pCount = 1
	        		}
	        	}
	        	tmp += String(pCount)
	        	tmp += String(p)
	        	ret = tmp
	        }
        }
        return ret
    }
}