//: [Previous](@previous)

/*
 
 面试题 01.07. Rotate Matrix LCCI
 
 Given an image represented by an N x N matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

  

 Example 1:

 Given matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],

 Rotate the matrix in place. It becomes:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 Example 2:

 Given matrix =
 [
   [ 5, 1, 9,11],
   [ 2, 4, 8,10],
   [13, 3, 6, 7],
   [15,14,12,16]
 ],

 Rotate the matrix in place. It becomes:
 [
   [15,13, 2, 5],
   [14, 3, 4, 1],
   [12, 6, 8, 9],
   [16, 7,10,11]
 ]
 
 */

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count, mid = n / 2
        print(n, mid)
        guard n > 0 else { return }
        for i in 0..<n {
            for j in 0..<n-i-1 {
                let newX = n - j - 1
                let newY = n - i - 1
                let temp = matrix[i][j]
                matrix[i][j] = matrix[newX][newY]
                matrix[newX][newY] = temp
            }
        }
        for i in 0..<mid {
            for j in 0..<n {
                let newX = n - i - 1
                let temp = matrix[i][j]
                matrix[i][j] = matrix[newX][j]
                matrix[newX][j] = temp
            }
        }
    }
}

let solution = Solution()
var input = [[1,2,3],[4,5,6],[7,8,9]]
solution.rotate(&input)
input

//: [Next](@next)
