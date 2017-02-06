class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
    	if strs.isEmpty {
    		return ""
    	}
        var res = strs[0]
        for i in 1 ..< strs.count {
        	while !strs[i].hasPrefix(res) && res != "" {
        		res = res.substring(to: res.index(before: res.endIndex))
        	}
        }
        return res
    }
}