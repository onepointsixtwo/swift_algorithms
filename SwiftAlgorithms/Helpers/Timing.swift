//
//  Timing.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 21/03/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

public func timeTest(code: () -> ()) {
    let date = Date()
    code()
    let timeInterval = Date().timeIntervalSince(date)
    NSLog("Test took %.3f seconds to run", timeInterval)
}
