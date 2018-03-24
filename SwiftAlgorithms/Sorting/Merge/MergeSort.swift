//
//  MergeSort.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 05/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation


class MergeSort<T: Comparable>: BaseSorting<T> {

    override func sort() -> [T] {
        mergeSort(leftIndex: 0, rightIndex: array.count - 1)
        return array
    }

    private func mergeSort(leftIndex: Int, rightIndex: Int) {
        if rightIndex > leftIndex {
            let middle = Int((leftIndex + rightIndex) / 2)

            // Because we recursively call ourself _before_ we hit the merge function, we actually split the array into single
            // values before hitting it, and then work backwards from the single values to the larger list, so when we hit an array
            // with multiple values in the merge function, we can already be sure that the subarrays are internally in the right order
            // and we just have to order them within the array by which order the overall subarrays should be in
            mergeSort(leftIndex: leftIndex, rightIndex: middle)
            mergeSort(leftIndex: middle + 1, rightIndex: rightIndex)

            merge(leftIndex: leftIndex, middleIndex: middle, rightIndex: rightIndex)
        }
    }

    // Merge the two sub arrays which can internally already be considered ordered
    // The first array is from leftIndex -> middleIndex, the second from middleIndex + 1 > rightIndex
    private func merge(leftIndex: Int, middleIndex: Int, rightIndex: Int) {

        // Take the sub arrays from the main list by using subscripted arrays (array slices technically)
        let subArrayLeft = Array(array[leftIndex...middleIndex])
        let subArrayRight = Array(array[(middleIndex + 1)...rightIndex])

        // Get the highest indexes in both of the sub arrays
        let highestIndexLeft = subArrayLeft.count - 1
        let highestIndexRight = subArrayRight.count - 1

        // Create a combined array of the sub array left and right
        // probably the most important part, this works because we know the sub arrays are already ordered, so we pick off the next one each time
        // from the array containing the next value
        var tempLeftAndRightCombinedArray = [T]()
        var leftArrayPosition = 0
        var rightArrayPosition = 0

        // Keep looping until we hit the highest index for one of our sub arrays
        while ((leftArrayPosition <= highestIndexLeft) && (rightArrayPosition <= highestIndexRight)) {
            let leftValue = subArrayLeft[leftArrayPosition]
            let rightValue = subArrayRight[rightArrayPosition]

            if rightValue >= leftValue {
                tempLeftAndRightCombinedArray.append(leftValue)
                leftArrayPosition += 1
            } else {
                tempLeftAndRightCombinedArray.append(rightValue)
                rightArrayPosition += 1
            }
        }

        // Once the loop is completed, we may have not hit the highest index for both left and right, so we copy remaining values straight onto the end of the temp left and right combining array (in reality, since we only exit the above loop when either left or right has topped out, we should only hit one or other of the code blocks contained within the below while loops, not both.
        while (leftArrayPosition <= highestIndexLeft) {
            tempLeftAndRightCombinedArray.append(subArrayLeft[leftArrayPosition])
            leftArrayPosition += 1
        }

        while (rightArrayPosition <= highestIndexRight) {
            tempLeftAndRightCombinedArray.append(subArrayRight[rightArrayPosition])
            rightArrayPosition += 1
        }

        // Finally, we copy the temp left and right combined array back into the original array
        var tmpIndex = 0
        for index in leftIndex...rightIndex {
            array[index] = tempLeftAndRightCombinedArray[tmpIndex]
            tmpIndex += 1
        }
    }
}
