public class Solution {
    public IList<IList<string>> SolveNQueens(int n) {
        IList<IList<string>> solutions = new List<IList<string>>();
        int[] chessboard = new int[n];
        for (int i = 0; i < n; ++i) {
            chessboard[i] = i;
        }
        solve(0, chessboard, n, solutions);
        return solutions;
    }
    
    private void solve(int index, int[] chessboard, int n, IList<IList<string>> solutions) {
        if (index == n && isValid(chessboard)) {
            solutions.Add(formatChessboard(chessboard, n));
            return;
        }
        
        for (int i = index; i < n; ++i) {
            int tmp = chessboard[index];
            chessboard[index] = chessboard[i];
            chessboard[i] = tmp;
            
            solve(index + 1, chessboard, n, solutions);
            
            chessboard[i] = chessboard[index];
            chessboard[index] = tmp;
        }
    }
    
    private bool isValid(int[] chessboard) {
        int n = chessboard.Length;
        for (int i = 0; i < n - 1; ++i) {
            for (int j = i + 1; j < n; ++j) {
                if (chessboard[i] - i == chessboard[j] - j || chessboard[i] + i == chessboard[j] + j) {
                    return false;
                }
            }
        }
        return true;
    }
    
    private IList<string> formatChessboard(int[] chessboard, int n) {
        IList<string> result = new List<string>(n);
        char[] tmp = new char[n];
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                tmp[j] = chessboard[i] == j ? 'Q' : '.';
            }
            result.Add(new string(tmp));
        }
        return result;
    }
}