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