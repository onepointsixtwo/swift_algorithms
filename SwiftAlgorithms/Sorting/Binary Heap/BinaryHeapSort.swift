//
//  BinaryHeapSort.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 24/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

class BinaryHeapSort<T: Comparable>: BaseSorting<T> {

    override func sort() -> [T] {
        heapSort()
        return array
    }

    override func name() -> String {
        return "HeapSort"
    }

    private func heapSort() {
        // Build the max heap
        buildMaxHeap()

        // Get index of last element
        var lastElementIndex = array.count - 1

        // Continue picking elements off the heap until we have none remaining
        while lastElementIndex > 0 {
            swap(fromIndex: 0, toIndex: lastElementIndex)
            heapify(startIndex: 0, endIndex: lastElementIndex)
            lastElementIndex -= 1
        }
    }

    /*
        To build our map heap, we basically just call heapify multiple times, starting from the lowest layer of nodes which have children.
        This is calculated as the length / 2 - 1. Again, this is pretty easy to see when you draw out an actual tree - this will always give the last node
        in the layer which has children (prior to the layer which is solely leaf nodes).
        We then iterate backwards through the nodes calling heapify to make sure each layer is ordered correctly. At the end we will have a correctly ordered max heap.
     */
    private func buildMaxHeap() {
        let midPoint = Int((array.count / 2) - 1)

        var iterator = midPoint
        while (iterator >= 0) {
            heapify(startIndex: iterator, endIndex: array.count)
            iterator -= 1
        }
    }

    private func heapify(startIndex: Int,
                         endIndex: Int) {
        var currentNodeIndex = startIndex

        while (currentNodeIndex < endIndex) {
            /*
                This took me a minute to understand, but it's actually really simple. Because it's a binary tree, and we know that each node can have a max of two children, then we know that
                the children for a node always reside at a point that is double it's own array index + 1.
                You can draw this out and it becomes really obvious.
                So for the array 10 | 8 | 3 | 7 | 5 | 1 which is actually already a max heap, the tree representation would be
                          10
                         /  \
                        8    3
                       / \
                      7   5
             So using the below formula, the children for 10 (index 0) should be at 2 * 0 + 1 and 2*0 + 2 which they are (indexes 1 and 2 respectively).
             Likewise, for 8 (at index 1) the children should be at 2 * 1 + 1 (3) and 2 * 1 + 2 (4) which they are (array[3] == 7 and array[4] == 5)

             */
            let leftChildIndex = (2 * currentNodeIndex) + 1
            let rightChildIndex = leftChildIndex + 1

            /*
                Find the index of the largest element out of the parent and it's two children.
                Start by setting to the current node for if the current node actually is ordered correctly
                with its children, and then check if either child is larger and if so, swap with largest child.
            */
            var largestElementIndex = currentNodeIndex

            if leftChildIndex < endIndex && array[leftChildIndex] > array[largestElementIndex] {
                largestElementIndex = leftChildIndex
            }

            if rightChildIndex < endIndex && array[rightChildIndex] > array[largestElementIndex] {
                largestElementIndex = rightChildIndex
            }

            /*
                If no changes are required, just continue
             */
            if (largestElementIndex == currentNodeIndex) {
                continue
            }

            swap(fromIndex:currentNodeIndex, toIndex:largestElementIndex)

            /*
                Continue through the nodes by setting the next node to the current node index
             */
            currentNodeIndex = largestElementIndex
        }
    }

    private func swap(fromIndex: Int,
                      toIndex: Int) {
        let value = array[toIndex]
        array[toIndex] = array[fromIndex]
        array[fromIndex] = value
    }
}
