//
//  DijkstraAlgorithms.swift
//  SwiftAlgorithms
//
//  Created by Kartupelis, John on 21/02/2018.
//  Copyright © 2018 Kartupelis, John. All rights reserved.
//

import Foundation

/**
    DATA CLASSES
 */

/*
    The Node class (could also be called Vertex) is to store the discrete points on the graph.
    It has a key, which can be compared to others so that we can check equality
 */
class Node<T: Hashable>: Hashable {
    var hashValue: Int {
        return key.hashValue
    }
    let key: T
    let identifier: String

    init(key: T, identifier: String = "") {
        self.key = key
        self.identifier = identifier
    }

    static func ==(lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.key == rhs.key
    }
}

/*
    The Edge class represents an Edge on the graph, that is, something which connects two nodes.
    It has a source, a destination and a weight (since this is a weighted graph!)
 */
class Edge<T: Hashable>: Hashable {
    var hashValue: Int {
        let sourceHash = source.hashValue
        let destinationHash = destination.hashValue
        return (sourceHash << 5) &+ sourceHash &+ destinationHash
    }
    let source: Node<T>
    let destination: Node<T>
    let weight: Int
    let identifier: String

    init(source: Node<T>, destination: Node<T>, weight: Int, identifier: String = "") {
        self.source = source
        self.destination = destination
        self.weight = weight
        self.identifier = identifier
    }

    static func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source && lhs.destination == rhs.destination
    }
}


/**
    GRAPH CLASS
 */
class WeightedGraph<T: Hashable> {

    var nodes = Set<Node<T>>()
    var edges = Set<Edge<T>>()

    func addNode(key: T, identifier: String = "") {
        nodes.insert(Node(key: key, identifier: identifier))
    }

    //Returns a boolean for whether we successfully inserted the edge (i.e. both the source and destination are known)
    @discardableResult func addEdge(sourceKey: T, destinationKey: T, weight: Int, identifier: String = "") -> Bool {
        guard let sourceNode = nodeWithKey(key: sourceKey),
            let destinationNode = nodeWithKey(key: destinationKey) else {
                return false
        }
        let edge = Edge(source: sourceNode, destination: destinationNode, weight: weight, identifier: identifier)
        if edges.contains(edge) {
            edges.remove(edge)
        }
        edges.insert(edge)
        return true
    }

    func nodeWithKey(key: T) -> Node<T>? {
        for node in nodes {
            if node.key == key {
                return node
            }
        }
        return nil
    }
}


/**
    DIJKSTRA'S ALGORITHM IMPLEMENTATION
 */
class DijkstraAlgorithm<T: Hashable> {

    let weightedGraph : WeightedGraph<T>
    var settledNodes = Set<Node<T>>()
    var unsettledNodes = Set<Node<T>>()
    var distances = [Node<T>: Int]()
    var predecessors = [Node<T>: Node<T>]()

    init(weightedGraph: WeightedGraph<T>) {
        self.weightedGraph = weightedGraph
    }

    func run(source: Node<T>) {
        // Set the distances for all nodes to high
        for node in weightedGraph.nodes {
            distances[node] = Int.max
        }

        // Make sure our collections are empty since this could be run twice (unintentionally)
        settledNodes.removeAll(keepingCapacity: true)
        unsettledNodes.removeAll(keepingCapacity: true)
        predecessors.removeAll()

        // Add our starting point to the set of unsettled nodes
        unsettledNodes.insert(source)
        distances[source] = 0

        while !unsettledNodes.isEmpty {
            if let currentNode = getNodeWithLowestDistance(unsettledNodes) {
                unsettledNodes.remove(currentNode)
                settledNodes.insert(currentNode)
                evaluateNeighboursForNode(currentNode)
            }
        }
    }

    // The important part - work out the distances to the neighbours and add the neighbours to the list of unsettled nodes
    // so that their distances to their neighbours will be calculated when they are picked off the unsettlednodes list
    private func evaluateNeighboursForNode(_ node: Node<T>) {
        let destinations = getAvailableDestinations(node: node)
        for destination in destinations {
            // This is the shortest distance we currently know about - if we don't know about a distance at all, then we'll just return
            // Int.max so we'll replace the unknown with a known
            let currentShortestKnownDistanceToDestination = getDistance(node: destination)
            // The new distance to the destination - the distance to the given node plus the extra to the new destination
            let newDistanceToDestination = getDistance(node: node) + getDistance(source: node, destination: destination)

            // If the new distance is less than the old known one, then replace it
            if newDistanceToDestination < currentShortestKnownDistanceToDestination {
                distances[destination] = newDistanceToDestination

                //This allows us to calculate a path back to the source from any destination, by tracing back along the hashmap for each predecessor's
                //predecessor and so on. Each node of interest will only have one path to the starting node, because we're effectively tracing the path to
                //every node of interest (i.e. that can be reached from the given source node) by running this algorithm.
                predecessors[destination] = node

                unsettledNodes.insert(destination)
            }
        }
    }

    // Gets the available destinations for the given node i.e. those who connect via an edge whose source
    // is the given node
    private func getAvailableDestinations(node: Node<T>) -> [Node<T>] {
        var neighbours = [Node<T>]()

        for edge in weightedGraph.edges {
            if edge.source == node {
                neighbours.append(edge.destination)
            }
        }

        return neighbours
    }

    // Gets whether a node is already settled
    private func nodeIsSettled(_ node: Node<T>) -> Bool {
        return settledNodes.contains(node)
    }

    // Gets the node with the lowest distance in the hashset / dictionary of distances
    private func getNodeWithLowestDistance(_ nodes: Set<Node<T>>) -> Node<T>? {
        var lowestWeightNode: Node<T>? = nil
        for node in nodes {
            if lowestWeightNode != nil {
                if getDistance(node: lowestWeightNode) > getDistance(node: node) {
                    lowestWeightNode = node
                }
            } else {
                lowestWeightNode = node
            }
        }
        return lowestWeightNode
    }

    // Gets the distance between two given nodes, a source and a destination
    private func getDistance(source: Node<T>, destination: Node<T>) -> Int {
        var distance = Int.max
        for edge in weightedGraph.edges {
            if edge.source == source && edge.destination == destination {
                distance = edge.weight
                break
            }
        }
        return distance
    }

    // Gets the non-null distance for a node. Returns largest possible value if not in the array
    private func getDistance(node: Node<T>?) -> Int {
        var distance = Int.max
        if let node = node, let dist = distances[node] {
            distance = dist
        }
        return distance
    }
}







