/*
Given an absolute path for a file (Unix-style), simplify it.

For example,
path = "/home/", => "/home"
path = "/a/./b/../../c/", => "/c"
 */

class Solution {
    func simplifyPath(_ path: String) -> String {
        let comps = path.components(separatedBy: "/")
        var stack = [String]()
        
        for c in comps {
            if c == ".." {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else if c == "." {
                continue
            } else if c != "" {
                stack.append(c)
            }
        }
        
        return "/" + stack.joined(separator: "/")
    }
}