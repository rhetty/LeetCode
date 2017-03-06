/*
Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.

The Sudoku board could be partially filled, where empty cells are filled with the character '.'.


A partially filled sudoku which is valid.

Note:
A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.
 */

class Solution {
    func clean(_ array: inout [Bool]) {
        for i in 0 ..< array.count {
            array[i] = false
        }
    }

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var filled = [Bool](repeating: false, count: 10)
        var num = 0
        
        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                if board[i][j] == "." {
                    continue
                }
                num = Int(String(board[i][j]))!
                if filled[num] {
                    return false
                }
                filled[num] = true
            }
            clean(&filled)
        }
        clean(&filled)
        
        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                if board[j][i] == "." {
                    continue
                }
                num = Int(String(board[j][i]))!
                if filled[num] {
                    return false
                }
                filled[num] = true
            }
            clean(&filled)
        }
        clean(&filled)
        
        for i in 0 ..< 9 {
            for j in i/3*3 ..< i/3*3+3 {
                for k in i%3*3 ..< i%3*3+3 {
                    if board[j][k] == "." {
                        continue
                    }
                    num = Int(String(board[j][k]))!
                    if filled[num] {
                        return false
                    }
                    filled[num] = true
                }
            }
            clean(&filled)
        }
        
        return true
    }
}