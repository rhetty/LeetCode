/*
Given an array of strings, group anagrams together.

For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"], 
Return:

[
  ["ate", "eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note: All inputs will be in lower-case.
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = Dictionary<String, Array<String>>()
        for s in strs {
            var cs = [Character](s.characters)
            cs.sort()
            let key = String(cs)
            if var a = dict[key] {
                a.append(s)
                dict.updateValue(a, forKey:key)
            } else {
                dict.updateValue([s], forKey:key)
            }
        }
        
        var res = [[String]]()
        for k in dict.keys {
            res.append(dict[k]!)
        }
        
        return res
    }
}