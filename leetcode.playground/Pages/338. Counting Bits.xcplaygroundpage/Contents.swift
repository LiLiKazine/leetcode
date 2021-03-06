//: [Previous](@previous)

/*
 
 338. Counting Bits
 
 Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.

 Example 1:

 Input: 2
 Output: [0,1,1]
 Example 2:

 Input: 5
 Output: [0,1,1,2,1,2]
 Follow up:

 It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
 Space complexity should be O(n).
 Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
 
 */

/*
 方法一：Pop count 【通过】
 直觉

 对一个数字解决问题，并应用到全部。

 算法

 本问题可以看做 位 1 的个数 的后续。它计数一个无符号整数的位。结果称为 pop count，或 汉明权重。可以参看 位 1 的个数 的题解以获得更详细介绍。

 现在，我们先默认这个概念。假设我们有函数int popcount(int x) ，可以返回一个给定非负整数的位计数。我们只需要在 [0, num] 范围内循环并将结果存到一个列表中。

 Java

 public class Solution {
     public int[] countBits(int num) {
         int[] ans = new int[num + 1];
         for (int i = 0; i <= num; ++i)
             ans[i] = popcount(i);
         return ans;
     }
     private int popcount(int x) {
         int count;
         for (count = 0; x != 0; ++count)
           x &= x - 1; //zeroing out the least significant nonzero bit
         return count;
     }
 }
 复杂度分析

 时间复杂度：O(nk)O(nk)。对于每个整数 xx，我们需要 O(k)O(k) 次操作，其中 kk 是 xx 的位数。
 空间复杂度：O(n)O(n)。 我们需要 O(n)O(n) 的空间来存储计数结果。如果排除这一点，就只需要常数空间。
 方法二：动态规划 + 最高有效位 【通过】
 直觉

 利用已有的计数结果来生成新的计数结果。

 算法

 假设有一个整数：

 x = (1001011101)_2 = (605)_{10}
 x=(1001011101)
 2
 ​    
  =(605)
 10
 ​    
  

 我们已经计算了从 00 到 x - 1x−1 的全部结果。

 我们知道，xx 与 我们计算过的一个数只有一位之差:

 x' = (1011101)_2 = (93)_{10}
 x
 ′
  =(1011101)
 2
 ​    
  =(93)
 10
 ​    
  

 它们只在最高有效位上不同。

 让我们以二进制形式检查 [0, 3][0,3] 的范围：

 (0) = (0)_2
 (0)=(0)
 2
 ​    
  

 (1) = (1)_2
 (1)=(1)
 2
 ​    
  

 (2) = (10)_2
 (2)=(10)
 2
 ​    
  

 (3) = (11)_2
 (3)=(11)
 2
 ​    
  

 可以看出， 2 和 3 的二进制形式可以通过给 0 和 1 的二进制形式在前面加上 1 来得到。因此，它们的 pop count 只相差 1。

 类似的，我们可以使用 [0, 3][0,3] 作为蓝本来得到 [4, 7][4,7]。

 总之，对于pop count P(x)P(x)，我们有以下的状态转移函数：

 P(x + b) = P(x) + 1, b = 2^m > x
 P(x+b)=P(x)+1,b=2
 m
  >x

 有了状态转移函数，我们可以利用动态规划从 00 开始生成所有结果。

 Java

 public class Solution {
     public int[] countBits(int num) {
         int[] ans = new int[num + 1];
         int i = 0, b = 1;
         // [0, b) is calculated
         while (b <= num) {
             // generate [b, 2b) or [b, num) from [0, b)
             while(i < b && i + b <= num){
                 ans[i + b] = ans[i] + 1;
                 ++i;
             }
             i = 0;   // reset i
             b <<= 1; // b = 2b
         }
         return ans;
     }
 }
 复杂度分析

 时间复杂度：O(n)O(n)。对每个整数 xx，我们只需要常数时间。
 空间复杂度：O(n)O(n)。我们需要 O(n)O(n) 的空间来存储技术结果。如果排除这一点，就只需要常数空间。
 方法三：动态规划 + 最低有效位 【通过】
 直觉

 只要x'x
 ′
   小于 xx，且它们的 pop count 之间存在函数关系，就可以写出其他的状态转移函数。

 算法

 遵循上一方法的相同原则，我们还可以通过最低有效位来获得状态转移函数。

 观察xx 和 x' = x / 2x
 ′
  =x/2 的关系：

 x = (1001011101)_2 = (605)_{10}
 x=(1001011101)
 2
 ​    
  =(605)
 10
 ​    
  

 x' = (100101110)_2 = (302)_{10}
 x
 ′
  =(100101110)
 2
 ​    
  =(302)
 10
 ​    
  

 可以发现 x'x
 ′
   与 xx 只有一位不同，这是因为x'x
 ′
   可以看做 xx 移除最低有效位的结果。

 这样，我们就有了下面的状态转移函数：

 P(x) = P(x / 2) + (x \mod 2)
 P(x)=P(x/2)+(xmod2)

 Java

 public class Solution {
   public int[] countBits(int num) {
       int[] ans = new int[num + 1];
       for (int i = 1; i <= num; ++i)
         ans[i] = ans[i >> 1] + (i & 1); // x / 2 is x >> 1 and x % 2 is x & 1
       return ans;
   }
 }
 复杂度分析

 时间复杂度：O(n)O(n)。对每个整数 xx，我们只需要常数时间。
 空间复杂度：O(n)O(n)。与方法二相同。
 方法四：动态规划 + 最后设置位【通过】
 算法

 与上述方法思路相同，我们可以利用最后设置位。

 最后设置位是从右到左第一个为1的位。使用 x &= x - 1 将该位设置为0，就可以得到以下状态转移函数：

 P(x) = P(x \mathrel{\&} (x - 1)) + 1;
 P(x)=P(x&(x−1))+1;

 Java

 public class Solution {
   public int[] countBits(int num) {
       int[] ans = new int[num + 1];
       for (int i = 1; i <= num; ++i)
         ans[i] = ans[i & (i - 1)] + 1;
       return ans;
   }
 }
 复杂度分析

 时间复杂度：O(n)O(n)。 与方法三相同。
 空间复杂度：$$(n)$。与方法三相同。

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/counting-bits/solution/bi-te-wei-ji-shu-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

/*
 
 方法一：i & (i - 1)可以去掉i最右边的一个1（如果有），因此 i & (i - 1）是比 i 小的，而且i & (i - 1)的1的个数已经在前面算过了，所以i的1的个数就是 i & (i - 1)的1的个数加上1
 
 public int[] countBits(int num) {
     int[] res = new int[num + 1];
     for(int i = 1;i<= num;i++){  //注意要从1开始，0不满足
         res[i] = res[i & (i - 1)] + 1;
     }
     return res;
 }
 
 */

class Solution {
    
    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else {
            return [0]
        }
        var ans = Array(repeating: 0, count: num + 1)
        for i in 1...num {
            ans[i] = ans[i & (i - 1)] + 1
        }
        return ans
    }
    
    func stupid(_ num: Int) -> [Int] {
        var ans = [Int]()
        for i in 0...num {
            var val = i, count = 0
            while val > 1 {
                if val % 2 == 1 {
                    count += 1
                }
                val /= 2
            }
            if val == 1 {
                count += 1
            }
            ans.append(count)
        }
        return ans
    }
}


let solution = Solution()
let ans = solution.countBits(5)
ans

//: [Next](@next)
