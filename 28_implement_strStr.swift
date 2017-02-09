class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
    	if haystack.characters.count < needle.characters.count {
    		return -1
    	}
    	var htIndex: String.Index!
    	var ntIndex: String.Index!
        lb: for i in 0 ... haystack.characters.count - needle.characters.count {
        	htIndex = haystack.index(haystack.startIndex, offsetBy: i)
        	ntIndex = needle.startIndex
        	for j in 0 ..< needle.characters.count {
        		if haystack[htIndex] != needle[ntIndex] {
        			continue lb
        		}
        		htIndex = haystack.index(after: htIndex)
        		ntIndex = needle.index(after: ntIndex)
        	}
        	return i
        }
        return -1
    }
}