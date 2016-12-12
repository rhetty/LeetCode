class Solution {
    func reverse(_ x: Int) -> Int {
        var result = 0
        var y = x
        while y != 0 {
        	if abs(result) > Int(Int32.max) / 10 {
        		return 0
        	}
        	result = result * 10 + y % 10
        	y = y / 10
        }
        return result
    }
}

if CommandLine.arguments.count == 2 {
	if let n = Int(CommandLine.arguments[1]) {
		print(Solution().reverse(n))
	}
}