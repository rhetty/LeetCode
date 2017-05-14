/*
Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

For example,
Given board =

[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]
word = "ABCCED", -> returns true,
word = "SEE", -> returns true,
word = "ABCB", -> returns false.
 */

class Solution {
    func exist(_ board: [[Character]], _ x: Int, _ y: Int, _ letters: [Character], _ p: Int, _ visited: inout [[Bool]]) -> Bool {
        if p == letters.count { return true }
        
        visited[x][y] = true
        
        if x > 0 && !visited[x - 1][y] && board[x - 1][y] == letters[p] && exist(board, x - 1, y, letters, p + 1, &visited) {
            return true
        }
        
        if x < board.count - 1 && !visited[x + 1][y] && board[x + 1][y] == letters[p] && exist(board, x + 1, y, letters, p + 1, &visited) {
            return true
        }
        
        if y > 0 && !visited[x][y - 1] && board[x][y - 1] == letters[p] && exist(board, x, y - 1, letters, p + 1, &visited) {
            return true
        }
        
        if y < board.first!.count - 1 && !visited[x][y + 1] && board[x][y + 1] == letters[p] && exist(board, x, y + 1, letters, p + 1, &visited) {
            return true
        }
        
        visited[x][y] = false
        return false
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if word.isEmpty { return true }
        if board.isEmpty { return false }
        
        let m = board.count
        let n = board.first!.count
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        
        let letters = [Character](word.characters)
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                if board[i][j] == letters.first! && exist(board, i, j, letters, 1, &visited) {
                    return true
                }
            }
        }
        
        return false
    }
}