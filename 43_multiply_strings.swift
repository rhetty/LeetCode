class Solution {
    func multiply(_ num1: [Character], _ num2: Character, _ zs: Int) -> [Character] {
        var carry = 0
        var res = [Character]()
        
        for i in 0 ..< num1.count {
            let m = Int(String(num1[num1.count - i - 1]))! * Int(String(num2))! + carry
            res.append(Character(String(m % 10)))
            carry = m / 10
        }
        
        if carry > 0 {
            res.append(Character(String(carry)))
        }
        
        res.reverse()
        
        for i in 0 ..< zs {
            res.append("0")
        }
        
        return res
    }
    
    func add(_ num1: [Character], _ num2: [Character]) -> [Character] {
        var res = [Character]()
        var carry = 0
        let n = min(num1.count, num2.count)
        
        for i in 0 ..< n {
            let m = Int(String(num1[num1.count - i - 1]))! + Int(String(num2[num2.count - i - 1]))! + carry
            res.append(Character(String(m % 10)))
            carry = m / 10
        }
        
        if num1.count > n {
            for i in 0 ..< num1.count - n {
                let m = Int(String(num1[num1.count - n - i - 1]))! + carry
                res.append(Character(String(m % 10)))
                carry = m / 10
            }
        }
        
        if num2.count > n {
            for i in 0 ..< num2.count - n {
                let m = Int(String(num2[num2.count - n - i - 1]))! + carry
                res.append(Character(String(m % 10)))
                carry = m / 10
            }
        }
        
        if carry > 0 {
            res.append(Character(String(carry)))
        }
        
        res.reverse()
        
        return res
    }
    
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        let d1 = [Character](num1.characters)
        let d2 = [Character](num2.characters)
        
        var res: [Character] = ["0"]
        for i in 0 ..< d1.count {
            let m = multiply(d2, d1[d1.count - i - 1], i)
            res = add(res, m)
        }
        
        return String(res)
    }
}