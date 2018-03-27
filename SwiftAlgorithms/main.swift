//
//  main.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 21/02/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

let array = [10, 8, 3, 7, 5, 12, 1]
let heapsort = BinaryHeapSort(array)
heapsort.sort()

// Create an instance of sorting test (will mean that the same array is sorted by each, giving proper timings)
let sortingTest = SortingTest()

timeTest {
    NSLog("Running Quicksort")
    sortingTest.run(sortingAlgorithmType: QuickSort<Int>.self)
}

timeTest {
    NSLog("Running Mergesort")
    sortingTest.run(sortingAlgorithmType: MergeSort<Int>.self)
}

timeTest {
    NSLog("Running Heapsort")
    sortingTest.run(sortingAlgorithmType: BinaryHeapSort<Int>.self)
}

timeTest {
    NSLog("Running BubbleSort")
    sortingTest.run(sortingAlgorithmType: BubbleSort<Int>.self)
}
