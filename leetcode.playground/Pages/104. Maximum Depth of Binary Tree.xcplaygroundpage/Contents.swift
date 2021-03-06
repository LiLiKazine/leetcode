//: [Previous](@previous)

/*
 104. Maximum Depth of Binary Tree

 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Note: A leaf is a node with no children.

 Example:

 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its depth = 3.

 */

import Foundation



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
 
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        let depth = trace(root, lev: 0)
        return depth
    }
    
    func trace(_ node: TreeNode?, lev: Int) -> Int {
        if node == nil {
            return lev
        }
        let depth = max(trace(node?.left, lev: lev+1), trace(node?.right, lev: lev+1))
        return depth
    }
}

//: [Next](@next)
