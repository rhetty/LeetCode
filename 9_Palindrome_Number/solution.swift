class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
        	return false
        }
        let str = String(x)
        for i in 0 ..< str.characters.count/2 {
        	if str.characters[str.index(str.startIndex, offsetBy: i)] != str.characters[str.index(str.endIndex, offsetBy: -i - 1)] {
        		return false
        	}
        }
        return true
    }
}

if CommandLine.arguments.count == 2 {
  if let n = Int(CommandLine.arguments[1]) {
  	  print(Solution().isPalindrome(n))
  	}
}