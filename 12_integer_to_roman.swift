/*
Given an integer, convert it to a roman numeral.

Input is guaranteed to be within the range from 1 to 3999.
 */

class Solution {
    func intToRoman(_ num: Int) -> String {
      let map:Dictionary<Int, String> = [1:"I", 5:"V", 10:"X", 50:"L", 100:"C", 500:"D", 1000:"M"]
      var ret = ""
      var flag = 1000
      var n = num

      while flag > 0 {
        var tmp = n / flag
        if tmp > 0 {
          n = n % flag
          if tmp == 4 {
            ret.append(map[flag]!)
            ret.append(map[5 * flag]!)
          } else if tmp == 9 {
            ret.append(map[flag]!)
            ret.append(map[10 * flag]!)
          } else {
            if tmp >= 5 {
              tmp = tmp - 5
              ret.append(map[5 * flag]!)
            }
            for i in 0 ..< tmp {
              ret.append(map[flag]!)
            }
          }
        }
        flag = flag / 10
      }

      return ret
    }
}