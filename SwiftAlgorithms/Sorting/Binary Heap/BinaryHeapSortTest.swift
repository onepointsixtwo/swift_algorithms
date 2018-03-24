//
//  BinaryHeapSortTest.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 24/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

class BinaryHeapSortTest {

    func run() {
        var unsortedArray = [Int]()
        for _ in 1..<arc4random_uniform(10000) {
            unsortedArray.append(Int(arc4random()))
        }

        let sortedArray = unsortedArray.sorted()
        let ourQuicksortedArray = BinaryHeapSort(unsortedArray).sort()
        assert(sortedArray == ourQuicksortedArray, "Our quicksorted array should be the same as the system sorted array")
        NSLog("Successfully performed quicksort")
    }
}
