//: [Previous](@previous)

/*
 
 1049. Last Stone Weight II
 
 You are given an array of integers stones where stones[i] is the weight of the ith stone.

 We are playing a game with the stones. On each turn, we choose any two stones and smash them together. Suppose the stones have weights x and y with x <= y. The result of this smash is:

 If x == y, both stones are destroyed, and
 If x != y, the stone of weight x is destroyed, and the stone of weight y has new weight y - x.
 At the end of the game, there is at most one stone left.

 Return the smallest possible weight of the left stone. If there are no stones left, return 0.

  

 Example 1:

 Input: stones = [2,7,4,1,8,1]
 Output: 1
 Explanation:
 We can combine 2 and 4 to get 2, so the array converts to [2,7,1,8,1] then,
 we can combine 7 and 8 to get 1, so the array converts to [2,1,1,1] then,
 we can combine 2 and 1 to get 1, so the array converts to [1,1,1] then,
 we can combine 1 and 1 to get 0, so the array converts to [1], then that's the optimal value.
 Example 2:

 Input: stones = [31,26,33,21,40]
 Output: 5
 Example 3:

 Input: stones = [1,2]
 Output: 1
  

 Constraints:

 1 <= stones.length <= 30
 1 <= stones[i] <= 100
 
 */

class Solution {
    func lastStoneWeightII(_ stones: [Int]) -> Int {
        let sum = stones.reduce(0, +), n = stones.count, m = sum / 2
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)
        dp[0][0] = true
        for i in 0..<n {
            for j in 0...m {
                if j < stones[i] {
                    dp[i + 1][j] = dp[i][j]
                } else {
                    dp[i + 1][j] = dp[i][j] || dp[i][j - stones[i]]
                }
            }
        }
        var j = m
        while !dp[n][j] {
            j -= 1
        }
        return sum - 2 * j
    }
}

let stones = [2,7,4,1,8,1]
//let stones = [31,26,33,21,40]
let solution = Solution()
let ans = solution.lastStoneWeightII(stones)
ans

/*
 
 class Solution {
 public:
     int lastStoneWeightII(vector<int> &stones) {
         int sum = accumulate(stones.begin(), stones.end(), 0);
         int n = stones.size(), m = sum / 2;
         vector<vector<int>> dp(n + 1, vector<int>(m + 1));
         dp[0][0] = true;
         for (int i = 0; i < n; ++i) {
             for (int j = 0; j <= m; ++j) {
                 if (j < stones[i]) {
                     dp[i + 1][j] = dp[i][j];
                 } else {
                     dp[i + 1][j] = dp[i][j] || dp[i][j - stones[i]];
                 }
             }
         }
         for (int j = m;; --j) {
             if (dp[n][j]) {
                 return sum - 2 * j;
             }
         }
     }
 };
 
 */

//: [Next](@next)
