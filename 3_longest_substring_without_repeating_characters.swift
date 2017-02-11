/**
Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var max = 0
        var i = 0
        let chars = [Character](s.characters)
        var map = [Character:Int]()
        var char: Character
        var curLen = 0

        while chars.count - i + curLen > max {
        	char = chars[i]

        	if let pos = map[char] {
        		for ri in i - curLen ..< pos {
        			map[chars[ri]] = nil
        		}
        		curLen = i - pos - 1
    		}
			map[char] = i
			i = i + 1
			curLen = curLen + 1

			if curLen > max {
				max = curLen
			}
        }

        return max
    }
}