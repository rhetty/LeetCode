class Solution {
  func myAtoi(_ str: String) -> Int {
    if str.isEmpty {
      return 0
    }
    var neg = false
    var result = 0
    var begin = false
    var fu = false
    for c in str.characters {
      if !begin && c == " " {
        continue
      } else if !begin && !fu && c == "-" {
        neg = true
        fu = true
        begin = true
        continue
      } else if !begin && !fu && c == "+" {
        neg = false
        fu = true
        begin = true
        continue
      }
      begin = true
      if let d = Int(String(c)) {
        result = result * 10 + d
        if !neg && result >= Int(Int32.max) {
          return Int(Int32.max)
        } else if neg && -result <= Int(Int32.min) {
          return Int(Int32.min)
        }
      } else {
        break
      }
    }
    return result * (neg ? -1 : 1)
  }
}

if CommandLine.arguments.count == 2 {
  let n = CommandLine.arguments[1]
  print(Solution().myAtoi(n))
}
