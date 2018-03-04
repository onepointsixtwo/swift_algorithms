//
//  BubbleSort.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 04/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation


class BubbleSort<T: Comparable> {

    private var unsortedList: [T]

    init(_ unsortedList: [T]) {
        self.unsortedList = unsortedList
    }

    func run() -> [T] {
        var swapsPerformed = 1
        // We want to take an element and the one after, so we want to loop to one less than the array count
        let iterations = unsortedList.count - 1

        // If there were any swaps performed we are not yet in order
        while (swapsPerformed > 0) {

            // Reset swaps performed
            swapsPerformed = 0

            // Go through and swap any elements which are in the wrong order compared to the element next to them
            // Whenever a swap is performed, increment the value of swaps performed
            for index in 0..<iterations {
                let thisItem = unsortedList[index]
                let nextItem = unsortedList[index + 1]

                if (thisItem > nextItem) {
                    swapsPerformed += 1

                    unsortedList[index] = nextItem
                    unsortedList[index + 1] = thisItem
                }
            }
        }
        return unsortedList
    }
}
