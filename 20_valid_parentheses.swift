/**
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 */

class Solution {
	var stack: [Character]

	init() {
		stack = [Character]()
	}

	func push(_ c: Character) {
		stack.append(c)
	}

	func pop() -> Character? {
		if stack.isEmpty {
			return nil
		}
		let last = stack.last
		stack.removeLast()
		return last
	}

    func isValid(_ s: String) -> Bool {
    	for c in s.characters {
    		if c == "(" || c == "{" || c == "[" {
    			push(c)
    		} else {
    			if let last = pop() {
    				if !((c == ")" && last == "(") || (c == "}" && last == "{") || (c == "]" && last == "[")) {
    					return false
    				}
				} else { // empty
					return false
				}
    		}
    	}
    	return stack.isEmpty
    }
}