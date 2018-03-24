//
//  BinaryTree.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 21/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

public class BinaryTreeNode {
    public let ID: Int
    public var left: BinaryTreeNode?
    public var right: BinaryTreeNode?

    init(ID: Int,
         left: BinaryTreeNode,
         right: BinaryTreeNode) {
        self.ID = ID
        self.left = left
        self.right = right
    }

    init(ID: Int) {
        self.ID = ID
    }

    func hasChildren() -> Bool {
        return left != nil || right != nil
    }
}

class BinaryTree {

    let root: BinaryTreeNode

    init(root: BinaryTreeNode) {
        self.root = root
    }

    func size() -> Int {
        return size(node: root)
    }

    private func size(node: BinaryTreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        return size(node: node.left) + 1 + size(node: node.right)
    }

    func isEqualToTree(tree: BinaryTree) -> Bool {
        return treesAreEqual(node1: self.root, node2: tree.root)
    }

    func treesAreEqual(node1: BinaryTreeNode?,
                       node2: BinaryTreeNode?) -> Bool {
        if let node1 = node1,
            let node2 = node2 {
            return node1.ID == node2.ID &&
                treesAreEqual(node1: node1.left, node2:node2.left) &&
                treesAreEqual(node1: node1.right, node2:node2.right)
        } else {
            // If we hit the else (i.e. they're not both non-null)
            // then we return true if both are null, otherwise false
            return node1 == nil && node2 == nil
        }
    }

    func getDepth() -> Int {
        return getDepth(node: root)
    }

    func getDepth(node: BinaryTreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        let leftDepth = getDepth(node: node.left)
        let rightDepth = getDepth(node: node.right)

        return max(leftDepth, rightDepth) + 1
    }

    func deleteTree() {
        deleteTree(node: root)
    }

    func deleteTree(node: BinaryTreeNode) {
        if let left = node.left {
            deleteTree(node: left)
        }
        node.left = nil

        if let right = node.right {
            deleteTree(node: right)
        }
        node.right = nil
    }

    func mirrorTree() {
        mirrorTree(node: root)
    }

    func mirrorTree(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        mirrorTree(node: node.right)
        mirrorTree(node: node.left)

        let left = node.left
        node.left = node.right
        node.right = left
    }
}
