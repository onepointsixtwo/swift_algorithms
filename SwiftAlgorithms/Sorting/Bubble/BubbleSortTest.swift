//
//  BubbleSortTest.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 04/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

class BubbleSortTests {

    func run() {
        let a = [3, 2, 1, 1, 3, 8, 5, 7, 8, 9, 10]
        let sort = BubbleSort(a)
        let sorted = sort.run()
        assert(sorted == [1, 1, 2, 3, 3, 5, 7, 8, 8, 9, 10])
    }
}
