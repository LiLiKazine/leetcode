//: [Previous](@previous)

/*
 
 781. Rabbits in Forest
 
 In a forest, each rabbit has some color. Some subset of rabbits (possibly all of them) tell you how many other rabbits have the same color as them. Those answers are placed in an array.

 Return the minimum number of rabbits that could be in the forest.

 Examples:
 Input: answers = [1, 1, 2]
 Output: 5
 Explanation:
 The two rabbits that answered "1" could both be the same color, say red.
 The rabbit than answered "2" can't be red or the answers would be inconsistent.
 Say the rabbit that answered "2" was blue.
 Then there should be 2 other blue rabbits in the forest that didn't answer into the array.
 The smallest possible number of rabbits in the forest is therefore 5: 3 that answered plus 2 that didn't.

 Input: answers = [10, 10, 10]
 Output: 11

 Input: answers = []
 Output: 0
 Note:

 answers will have length at most 1000.
 Each answers[i] will be an integer in the range [0, 999].
 
 */

class Solution {
    func numRabbits(_ answers: [Int]) -> Int {
        guard !answers.isEmpty else {
            return 0
        }
        var count: [Int: Int] = [:], ans = 0
        for val in answers {
            count[val] = (count[val] ?? 0) + 1
        }
        for (k, v) in count {
            if k  == 0 {
                ans += v
            } else {
                ans += v / (k + 1) * (k + 1)
                ans += v % (k + 1) > 0 ? (k + 1) : 0
            }
        }
        return ans
    }
}

let answers = [0,0,1,1,1]
//let answers = [1,0,1,0,0]
//let answers = [10, 10, 10]
//let answers = [1, 1, 2]
let solution = Solution()
let ans = solution.numRabbits(answers)
ans

//: [Next](@next)
