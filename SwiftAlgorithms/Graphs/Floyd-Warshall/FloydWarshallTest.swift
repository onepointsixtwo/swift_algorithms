//
//  FloydWarshallTest.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 22/02/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

/*
 EXPECTED OUTPUT
 6
 -1
 0
 106
 */

class FloydWarshallTest {


    func run() {
        let nodes = 4
        let floydWarshall = FloydWarshallAlgorithm(nodes: nodes)

        floydWarshall.addEdge(sourceNode: 2, destinationNode: 1, weight: 298)
        floydWarshall.addEdge(sourceNode: 3, destinationNode: 4, weight: 299)
        floydWarshall.addEdge(sourceNode: 2, destinationNode: 4, weight: 200)
        floydWarshall.addEdge(sourceNode: 2, destinationNode: 4, weight: 100)
        floydWarshall.addEdge(sourceNode: 3, destinationNode: 2, weight: 300)
        floydWarshall.addEdge(sourceNode: 3, destinationNode: 2, weight: 6)

        floydWarshall.run()

        produceOutputForPath(start: 3, end: 2, warshall: floydWarshall)
        produceOutputForPath(start: 4, end: 1, warshall: floydWarshall)
        produceOutputForPath(start: 1, end: 1, warshall: floydWarshall)
        produceOutputForPath(start: 3, end: 4, warshall: floydWarshall)
    }

    private func produceOutputForPath(start: Int, end: Int, warshall: FloydWarshallAlgorithm) {
        let output = warshall.matrix[start-1][end-1]
        if output != warshall.INF {
            print(output)
        } else {
            print(-1)
        }
    }
}
