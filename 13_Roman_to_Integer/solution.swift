class Solution {
    func romanToInt(_ s: String) -> Int {
        let map:Dictionary<Character, Int> = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
        var result = 0
        var last: Character = "I"
        for i in 0 ..< s.characters.count {
        	let c = s[s.index(s.endIndex, offsetBy:-i - 1)]
        	if map[c]! >= map[last]! {
        		result = result + map[c]!
        	} else {
        		result = result - map[c]!
        	}
        	last = c
        }
        return result
    }
}