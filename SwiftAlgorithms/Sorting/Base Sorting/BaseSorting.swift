//
//  BaseSorting.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 24/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

class BaseSorting<T: Comparable> {

    internal var array: [T]

    init(_ inputArray: [T]) {
        self.array = inputArray
    }

    func sort() -> [T] {
        preconditionFailure("run() must be overridden in subclasses of BaseSorting")
        return array
    }
}
