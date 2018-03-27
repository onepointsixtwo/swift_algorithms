//
//  SortingTest.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 25/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

class SortingTest {

    let unsortedArray: [Int]

    init() {
        var unsortedArray = [Int]()
        for _ in 1..<arc4random_uniform(10000) {
            unsortedArray.append(Int(arc4random()))
        }
        self.unsortedArray = unsortedArray
    }

    func run(sortingAlgorithmType: BaseSorting<Int>.Type) {
        let algorithm = sortingAlgorithmType.init(unsortedArray)
        let sortedArray = unsortedArray.sorted()
        let ourSortedArray = algorithm.sort()
        assert(sortedArray == ourSortedArray, String(format:"Our %@ array should be the same as the system sorted array", algorithm.name()))
        NSLog("Successfully performed %@", algorithm.name())
    }
}
