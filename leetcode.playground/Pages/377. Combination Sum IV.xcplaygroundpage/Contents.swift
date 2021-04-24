//: [Previous](@previous)

/*
 
 377. Combination Sum IV
 
 Given an array of distinct integers nums and a target integer target, return the number of possible combinations that add up to target.

 The answer is guaranteed to fit in a 32-bit integer.

  

 Example 1:

 Input: nums = [1,2,3], target = 4
 Output: 7
 Explanation:
 The possible combination ways are:
 (1, 1, 1, 1)
 (1, 1, 2)
 (1, 2, 1)
 (1, 3)
 (2, 1, 1)
 (2, 2)
 (3, 1)
 Note that different sequences are counted as different combinations.
 Example 2:

 Input: nums = [9], target = 3
 Output: 0
  

 Constraints:

 1 <= nums.length <= 200
 1 <= nums[i] <= 1000
 All the elements of nums are unique.
 1 <= target <= 1000
  

 Follow up: What if negative numbers are allowed in the given array? How does it change the problem? What limitation we need to add to the question to allow negative numbers?
 
 */

class Solution {
    
    var dp: [Int: Int] = [:]
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.filter { $0 <= target }.sorted()
        combines(nums, target)
        return dp[target]!
    }
    
    
    private func combines(_ nums: [Int], _ target: Int) {
        if let _ = dp[target] {
            return
        }
        var ans = 0
        for i in 0..<nums.count {
            if nums[i] == target {
                ans += 1
            } else if nums[i] < target {
                combines(nums, target - nums[i])
                ans += dp[target - nums[i]]!
            } else {
                break
            }
        }
        dp[target] = ans
        
    }
}

let nums = [1,2,3], target = 32
let solution = Solution()
let ans = solution.combinationSum4(nums, target)
ans

//: [Next](@next)
