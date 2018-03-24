//
//  QuickSortTest.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 21/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

class QuickSortTest {

    func run() {
        var unsortedArray = [Int]()
        for _ in 1..<arc4random_uniform(10000) {
            unsortedArray.append(Int(arc4random()))
        }

        let sortedArray = unsortedArray.sorted()
        let ourQuicksortedArray = QuickSort(unsortedArray).run()
        assert(sortedArray == ourQuicksortedArray, "Our quicksorted array should be the same as the system sorted array")
        NSLog("Successfully performed quicksort")
    }
}
