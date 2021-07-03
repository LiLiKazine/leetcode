//: [Previous](@previous)

/*
 
 451. Sort Characters By Frequency
 
 Given a string s, sort it in decreasing order based on the frequency of characters, and return the sorted string.

  

 Example 1:

 Input: s = "tree"
 Output: "eert"
 Explanation: 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
 Example 2:

 Input: s = "cccaaa"
 Output: "aaaccc"
 Explanation: Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
 Note that "cacaca" is incorrect, as the same characters must be together.
 Example 3:

 Input: s = "Aabb"
 Output: "bbAa"
 Explanation: "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.
  

 Constraints:

 1 <= s.length <= 5 * 105
 s consists of English letters and digits.
 
 */

class Solution {
    func frequencySort(_ s: String) -> String {

        var freqDict: [Character: Int] = [:], maxFreq = 0
        for c in s {
            freqDict[c] = (freqDict[c] ?? 0) + 1
            maxFreq = max(maxFreq, freqDict[c]!)
        }
        var barrels: [[Character]] = Array(repeating: [], count: maxFreq + 1)
        for (key, value) in freqDict {
            barrels[value].append(key)
        }
        var ans: [Character] = []
        for (k, v) in barrels.enumerated() {
            for c in v {
                ans.insert(contentsOf: Array(repeating: c, count: k), at: 0)
            }
            
        }
        return String(ans)
    }
}

let s = "cccaaa"
let solution = Solution()
let ans = solution.frequencySort(s)
ans

//: [Next](@next)
