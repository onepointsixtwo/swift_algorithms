//
//  BubbleSortTest.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 04/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

// Need to add merge sort, quick sort, heap sort! (And make sure you understand them inside out and add notes!)
class BubbleSortTest {

    func run() {
        var unsortedArray = [Int]()
        for _ in 1..<arc4random_uniform(10000) {
            unsortedArray.append(Int(arc4random()))
        }

        let sortedArray = unsortedArray.sorted()
        let ourQuicksortedArray = BubbleSort(unsortedArray).sort()
        assert(sortedArray == ourQuicksortedArray, "Our bubblesorted array should be the same as the system sorted array")
        NSLog("Successfully performed bubblesort")
    }
}
