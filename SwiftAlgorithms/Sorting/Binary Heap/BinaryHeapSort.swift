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
        return array
    }
}
