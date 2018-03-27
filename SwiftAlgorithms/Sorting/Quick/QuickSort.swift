//
//  QuickSort.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 21/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

class QuickSort<T: Comparable>: BaseSorting<T> {

    override func name() -> String {
        return "QuickSort"
    }

    override func sort() -> [T] {
        quickSort(lowIndex: 0, highIndex: array.count - 1)
        return array
    }

    private func quickSort(lowIndex: Int, highIndex: Int) {
        // Stop when we've reached the smallest possible groups i.e. the low index is no longer smaller than the high
        if lowIndex < highIndex {

            // Partition the results and return the index of the element we've partitioned around - then continue performing quicksort for the arrays above and below
            // the partition element
            let partitionIndex = partition(lowIndex: lowIndex, highIndex: highIndex)
            quickSort(lowIndex: lowIndex, highIndex: partitionIndex - 1)
            quickSort(lowIndex: partitionIndex + 1, highIndex: highIndex)
        }
    }

    /**
        This is the only important or hard to understand function in quicksort.
        We basically pick the last element and use it as a pivot, i.e. we put elements smaller than it to the left
        of the array, elements which are larger into the right.
    */
    private func partition(lowIndex: Int, highIndex: Int) -> Int {
        let pivotVaue = array[highIndex]

        var currentIndex = lowIndex - 1

        for index in lowIndex..<highIndex {
            // This is important - if the value at the index is _not_ smaller than the pivot value, then we just leave it and move to the next
            // so current index is not incremented
            // At the point current index stops being incremented (there are no elements left smaller than the pivot value) then we know that the next
            // index will be the pivot element's position, hence why at the end we swap the pivot element into the position it should be in (line 59-61)
            if array[index] <= pivotVaue {
                currentIndex += 1

                let tmp = array[currentIndex]
                array[currentIndex] = array[index]
                array[index] = tmp
            }
        }

        let tmp = array[currentIndex + 1]
        array[currentIndex + 1] = array[highIndex]
        array[highIndex] = tmp

        return currentIndex + 1
    }
}
