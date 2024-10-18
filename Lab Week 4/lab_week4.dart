class Location {
  String name;
  Map<String, int> neighbors;

  Location(this.name, this.neighbors);
}

class MapGraph {
  Map<String, Location> locations = {};

  void addLocation(Location location) {
    locations[location.name] = location;
  }

  // Function to calculate the total distance of a given path
  int calculatePathDistance(List<String> path) {
    int totalDistance = 0;
    for (int i = 0; i < path.length - 1; i++) {
      String current = path[i];
      String next = path[i + 1];
      totalDistance += locations[current]!.neighbors[next]!;
    }
    // Add distance back to the starting location
    totalDistance += locations[path.last]!.neighbors[path.first]!;
    return totalDistance;
  }

  // Function to generate all permutations of a list
  List<List<String>> permute(List<String> nodes) {
    if (nodes.length == 1) {
      return [nodes];
    }
    List<List<String>> permutations = [];
    for (int i = 0; i < nodes.length; i++) {
      List<String> remaining = List.from(nodes);
      String first = remaining.removeAt(i);
      List<List<String>> subPermutations = permute(remaining);
      for (List<String> subPermutation in subPermutations) {
        permutations.add([first] + subPermutation);
      }
    }
    return permutations;
  }

  // Solve TSP
  List<String> solveTSP(String start) {
    List<String> nodes = locations.keys.where((node) => node != start).toList();
    List<List<String>> permutations = permute(nodes);
    
    // Use a large number instead of infinity
    int minDistance = 999999;
    List<String> bestPath = [];

    for (var permutation in permutations) {
      List<String> path = [start] + permutation;
      int distance = calculatePathDistance(path);
      if (distance < minDistance) {
        minDistance = distance;
        bestPath = path;
      }
    }

    bestPath.add(start); // Return to the start
    print('Minimum distance: $minDistance');
    return bestPath;
  }
}

void main() {
  var mapGraph = MapGraph();

  // Adding locations and their respective neighbors
  mapGraph.addLocation(Location('A', {'B': 8, 'C': 3, 'D': 4, 'E': 10}));
  mapGraph.addLocation(Location('B', {'A': 8, 'C': 5, 'D': 2, 'E': 7}));
  mapGraph.addLocation(Location('C', {'A': 3, 'B': 5, 'D': 1, 'E': 6}));
  mapGraph.addLocation(Location('D', {'A': 4, 'B': 2, 'C': 1, 'E': 3}));
  mapGraph.addLocation(Location('E', {'A': 10, 'B': 7, 'C': 6, 'D': 3}));

  // Solve the TSP problem starting from 'A'
  var tspPath = mapGraph.solveTSP('A');

  // Print the optimal path
  print('Optimal TSP path: ${tspPath.join(' -> ')}');
}
