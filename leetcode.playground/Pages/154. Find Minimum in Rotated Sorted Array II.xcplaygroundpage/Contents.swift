//: [Previous](@previous)

/*
 
 154. Find Minimum in Rotated Sorted Array II
 
 Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,4,4,5,6,7] might become:

 [4,5,6,7,0,1,4] if it was rotated 4 times.
 [0,1,4,4,5,6,7] if it was rotated 7 times.
 Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].

 Given the sorted rotated array nums that may contain duplicates, return the minimum element of this array.

  

 Example 1:

 Input: nums = [1,3,5]
 Output: 1
 Example 2:

 Input: nums = [2,2,2,0,1]
 Output: 0
  

 Constraints:

 n == nums.length
 1 <= n <= 5000
 -5000 <= nums[i] <= 5000
 nums is sorted and rotated between 1 and n times.
  

 Follow up: This is the same as Find Minimum in Rotated Sorted Array but with duplicates. Would allow duplicates affect the run-time complexity? How and why?
 
 */

/*
 
 class Solution {
 public:
     int findMin(vector<int>& nums) {
         int low = 0;
         int high = nums.size() - 1;
         while (low < high) {
             int pivot = low + (high - low) / 2;
             if (nums[pivot] < nums[high]) {
                 high = pivot;
             }
             else if (nums[pivot] > nums[high]) {
                 low = pivot + 1;
             }
             else {
                 high -= 1;
             }
         }
         return nums[low];
     }
 };

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array-ii/solution/xun-zhao-xuan-zhuan-pai-xu-shu-zu-zhong-de-zui--16/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var i = 0, j = nums.count - 1
        while i < j {
            let mid = i + (j - i) / 2, val = nums[mid]
            if nums[j] < val {
                i = mid + 1
            } else if nums[j] > val {
                j = mid
            } else {
                j -= 1
            }
        }
        return nums[i]
    }
}

let nums = [1,3,5]
//let nums = [2,2,2,0,1]
let solution = Solution()
let ans = solution.findMin(nums)
ans

//: [Next](@next)
