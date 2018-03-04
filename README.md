# swift_algorithms

This is more or less a dumping ground for any algorithms I feel I need to understand and try implementing from scratch written in Swift for no particular reason other than I like it and Kotlin a lot, and picked one on a coin toss


If anyone else finds anything here useful then please, have at it! Though there are probably better documents written on these by people who aren't me!


## Weighted Graphs

### Dijkstra

The Dijkstra algorithm allows us to do such things as find the quickest route, or rate of burn out on a weighted graph when we have a known starting node. The way it's written here isn't hugely efficient - it could be made more efficient with the addition of a binary heap. I'll probably add this at a later date, but keep the original as it's far easier to understand the behaviour without.


### Floyd-Warshall

I don't naturally picture matrices easily, so this took me a little time to get my head around, _but_ it is actually pretty lovely in its simplicity. The basic premise, is that we convert our graph points into a matrix where all paths are infinite (read: value larger than any possible within data set in actuality since we're using integer values) except for the path between a point and itself, which are zero. So a graph with three nodes would look like this:

|               | A             | B     | C     |
| ------------- |:-------------:| -----:|------:|
|   A           | 0             | INF   | INF   |
|   B           | INF           | 0     | INF   |
|   C           | INF           | INF   | 0     |

Then, if we know that the weighting (distance, whatever) from A -> B is 10 we can fill that in:

|               | A             | B     | C     |
| ------------- |:-------------:| -----:|------:|
|   A           | 0             | 10    | INF   |
|   B           | INF           | 0     | INF   |
|   C           | INF           | INF   | 0     |

And so on until we have our constructed graph as a matrix (which in coding terms is a 2D array). From there the algorithm itself is wonderfully simple. We iterate over the nodes and check whether any of the paths going via an intermediary provide a shorter route between the nodes - if they provide shorter route than the existing one, then we can replace our existing with the new.
