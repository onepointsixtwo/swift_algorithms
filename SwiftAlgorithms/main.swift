//
//  main.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 21/02/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

timeTest {
    NSLog("Running Quicksort")
    QuickSortTest().run()
}

timeTest {
    NSLog("Running Mergesort")
    MergeSortTest().run()
}




let tree = BinaryTree(root: BinaryTreeNode(ID: 1))
tree.root.right = BinaryTreeNode(ID: 2)
tree.root.left = BinaryTreeNode(ID: 3)
tree.root.left?.left = BinaryTreeNode(ID: 4)
tree.root.left?.right = BinaryTreeNode(ID: 5)
print("Tree size = \(tree.size())")

let tree2 = BinaryTree(root: BinaryTreeNode(ID: 1))
tree2.root.right = BinaryTreeNode(ID: 2)
tree2.root.left = BinaryTreeNode(ID: 3)
tree2.root.left?.left = BinaryTreeNode(ID: 4)
tree2.root.left?.right = BinaryTreeNode(ID: 5)

print("Tree depth is \(tree2.getDepth())")

tree2.mirrorTree()
assert(tree2.root.right?.left?.ID == 5)

let equal = tree2.isEqualToTree(tree: tree)
if equal {
    print("Trees are equal")
} else {
    print("Trees are not equal")
}

tree2.deleteTree()
assert(tree2.getDepth() == 1)
assert(tree2.root.left == nil)
assert(tree2.root.right == nil)
