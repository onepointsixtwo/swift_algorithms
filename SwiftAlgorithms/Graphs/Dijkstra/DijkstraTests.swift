//
//  DijkstraTests.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 22/02/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

class DijkstraTests {

    func run() {
        // Create the weighted graph
        let weightedGraph = WeightedGraph<Int>()

        // Add the nodes
        for index in 1...4 {
            weightedGraph.addNode(key: index)
        }

        // Add the edges
        weightedGraph.addEdge(sourceKey: 2, destinationKey: 1, weight: 298)
        weightedGraph.addEdge(sourceKey: 3, destinationKey: 4, weight: 299)
        weightedGraph.addEdge(sourceKey: 2, destinationKey: 4, weight: 200)
        weightedGraph.addEdge(sourceKey: 2, destinationKey: 4, weight: 100)
        weightedGraph.addEdge(sourceKey: 3, destinationKey: 2, weight: 300)
        weightedGraph.addEdge(sourceKey: 3, destinationKey: 2, weight: 6)

        // Create the Dijkstra instance from our weighted grap
        let dijkstra = DijkstraAlgorithm(weightedGraph: weightedGraph)

        // Run the algorithm for each set
        runAlgorithm(dijkstra: dijkstra, sourceKey: 3, destinationKey: 2)
        runAlgorithm(dijkstra: dijkstra, sourceKey: 4, destinationKey: 1)
        runAlgorithm(dijkstra: dijkstra, sourceKey: 1, destinationKey: 1)
        runAlgorithm(dijkstra: dijkstra, sourceKey: 3, destinationKey: 4)
    }

    private func runAlgorithm(dijkstra: DijkstraAlgorithm<Int>, sourceKey: Int, destinationKey: Int) {
        if let sourceNode = dijkstra.weightedGraph.nodeWithKey(key: sourceKey),
            let destinationNode = dijkstra.weightedGraph.nodeWithKey(key: destinationKey) {
            dijkstra.run(source: sourceNode)
            if let distance = dijkstra.distances[destinationNode] {
                if distance != Int.max {
                    print(distance)
                } else {
                    print(-1)
                }
            } else {
                print(-1)
            }
        }
    }
}
