//
//  FloydWarshallAlgorithms.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 22/02/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

/*
    This feels a lot more complicated than Dijkstra, but maybe that's because I'm not great with matrices.
    However, it starts with setting up a matrix, of n * n, where n is the number of nodes.
    We then fill the matrix with what we know. The distance of a node to itself is always zero, so
    for a very simple example with only three nodes, it looks like this:

        0      1       2

    0   0      INF     INF

    1   INF     0      INF

    2   INF     INF     0

    INF == Infinite i.e. a very large known value that means we don't have a route between these nodes.
    For a graph which has 3 nodes but as yet no edges defined. If we were to define the edge from 0 -> 2 then the value in the top
    right of the matrix would change from infinite to that value, so if the value was say six, it would now look like this:

        0      1       2

    0   0      INF     6 (NEW VALUE)

    1   INF     0      INF

    2   INF     INF     0

    The above steps only cover the init() and the method to add edges. After that comes the actual algorithm.

    The matrix transform happens in run. We basically check if there is a path via an intermediary available, and if there is,
    replace the length with that path.

    NOTE: the -1s are there because our nodes are 1 indexed and Swift as most languages uses zero indexed arrays
 */
class FloydWarshallAlgorithm {

    // IMPORTANT
    // There's a 'gotcha' in here with the size of INF (which at 10000 is very obviously not actually infinite...)
    // But if we use Int.max then since we attempt to do an addition operation we end up with an EXC_BAD_INSTRUCTION
    // for arithmetic overflow so we basically want to pick a value too large to affect our set.
    let INF = 10000
    let nodes: Int
    var matrix : [[Int]]

    init(nodes: Int) {
        self.nodes = nodes
        matrix = Array(repeating: Array(repeating: 0, count: nodes), count: nodes)
        // Iterate over the matrix and set the values to be all infinite except for the distances from a node to itself
        for i in 1...nodes {
            for j in 1...nodes {
                var value = INF
                if i == j {
                    value = 0
                }
                matrix[i - 1][j - 1] = value
            }
        }
    }

    func addEdge(sourceNode: Int, destinationNode: Int, weight: Int) {
        matrix[sourceNode - 1][destinationNode - 1] = weight
    }

    func outputForPath(source: Int, destination: Int) -> Int {
        return matrix[source - 1][destination - 1]
    }

    func run() {
        for i in 0..<nodes {
            for j in 0..<nodes {
                for k in 0..<nodes {
                    let potentialNewValue = matrix[j][i] + matrix[i][k]
                    let existingValue = matrix[j][k]
                    if  potentialNewValue < existingValue {
                        matrix[j][k] = potentialNewValue
                    }
                }
            }
        }
    }
}
