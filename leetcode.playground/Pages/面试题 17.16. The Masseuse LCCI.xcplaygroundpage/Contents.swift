//: [Previous](@previous)

/*
 
 面试题 17.16. The Masseuse LCCI
 
 A popular masseuse receives a sequence of back-to-back appointment requests and is debating which ones to accept. She needs a break between appointments and therefore she cannot accept any adjacent requests. Given a sequence of back-to-back appoint­ ment requests, find the optimal (highest total booked minutes) set the masseuse can honor. Return the number of minutes.

 Note: This problem is slightly different from the original one in the book.

  

 Example 1:

 Input:  [1,2,3,1]
 Output:  4
 Explanation:  Accept request 1 and 3, total minutes = 1 + 3 = 4
 Example 2:

 Input:  [2,7,9,3,1]
 Output:  12
 Explanation:  Accept request 1, 3 and 5, total minutes = 2 + 9 + 1 = 12
 Example 3:

 Input:  [2,1,4,5,3,1,1,3]
 Output:  12
 Explanation:  Accept request 1, 3, 5 and 8, total minutes = 2 + 4 + 3 + 3 = 12
 
 */

import Foundation

class Solution {
    func massage(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var dp: [[Int]] = Array<[Int]>(repeating: [0, 0], count: nums.count)
        for i in 0..<nums.count {
            if i == 0 {
                dp[i][0] = nums[i]
            } else {
                dp[i][0] += dp[i-1][1] + nums[i]
                dp[i][1] += max(dp[i-1][0], dp[i-1][1])
            }
        }
        return max(dp[nums.count-1][0], dp[nums.count-1][1])
    }
}

//: [Next](@next)
