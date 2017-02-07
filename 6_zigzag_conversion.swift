/**
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"
Write the code that will take a string and make this conversion given a number of rows:

string convert(string text, int nRows);
convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
 */

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
    	if numRows <= 1 {
    		return s
    	}
        let count = s.characters.count
        var result = Array<Character>(repeating: " ", count: count)
        var row = 0
        var idx = 0
        var i = 0
        var iIdx: String.CharacterView.Index? = nil
        var iDiff = 0
        var odd = true

        while row < numRows {
        	i = row
        	iIdx = s.startIndex
        	iDiff = row
        	odd = true

	        while i < count {
	        	iIdx = s.index(iIdx!, offsetBy: iDiff)
	        	result[idx] = s[iIdx!]
	        	idx = idx + 1
	        	if row == 0 || row == numRows - 1 {
	        		iDiff = 2 * numRows - 2
	        	} else {
	        		iDiff = odd ? (numRows - row - 1) * 2 : row * 2
		        }
		        i = i + iDiff
		        odd = !odd
	        }
	        row = row + 1
	    }
	    return String(result)
    }
}

print(Solution().convert("hpgnhqcvaclbzvqhynazxwhxjtygujodausimufpysqzniinvinsgwsppsylbmqciimvetmeledannnivadbxvtonrardstlbhihawmnbrnofaycddecyzsoquhvnaiojrvlnjyqblginhkskqwlppbhjicwklmtekettekwpseezrzkhvvzkyguglsqwflarpvkvfjkypqxgpjqlgpxexrmimcerngiecuzjfljvejdtsvgbmehkxuujwbcmhmsljuxqhgnlprhkoplbvuntohelijzsxtdinazvjmiafpkufxxaskvgrctcnuukozvbcuylghnowyidxfgprdykfrmumihakcdmwczejmshmalkhtbawzlerzyfkhhujkifojkxxefkhswolxrjxenqfoxpvelfqvmfeyecdlokdmaqjraixpyddxsbdggububgvfkyrakwmmnxengbcegiezj"
,192))