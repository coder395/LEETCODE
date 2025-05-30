
import 'dart:collection';
import 'dart:math';

class Solution {
  List<int> maxTargetNodes(
      List<List<int>> edges1, List<List<int>> edges2, int k) {
    // Get max node index from both edge lists
    int n = 0;
    for (var e in edges1) {
      n = max(n, max(e[0], e[1]));
    }
    n += 1; // node labels are 0-indexed

    int m = 0;
    for (var e in edges2) {
      m = max(m, max(e[0], e[1]));
    }
    m += 1;

    // Create adjacency lists
    List<List<int>> adjList1 = List.generate(n, (_) => []);
    List<List<int>> adjList2 = List.generate(m, (_) => []);

    for (List<int> e in edges1) {
      adjList1[e[0]].add(e[1]);
      adjList1[e[1]].add(e[0]);
    }

    for (List<int> e in edges2) {
      adjList2[e[0]].add(e[1]);
      adjList2[e[1]].add(e[0]);
    }

    // Precompute reachable nodes within k from each node in tree1
    List<int> path1 = List.filled(n, 0);
    for (int i = 0; i < n; i++) {
      path1[i] = bfs(i, adjList1, k);
    }

    // Precompute max reachable nodes within k-1 from any node in tree2
    int maxFound = 0;
    for (int i = 0; i < m; i++) {
        if( k ==0) continue;
      int count = bfs(i, adjList2, k - 1);
      maxFound = max(maxFound, count);
    }

    // Add maxFound to all path1[i]
    for (int i = 0; i < n; i++) {
      path1[i] += maxFound;
    }

    return path1;
  }
int bfs(int start, List<List<int>> adjList, int k) {
    
  if (k == 0) return 1; // Only the node itself is reachable

  Set<int> visited = {};
  Queue<int> q = Queue();
  q.add(start);
  visited.add(start);

  int level = 0;
  int nodesReached = 1;

  while (q.isNotEmpty && level < k) {
    int size = q.length;
    for (int i = 0; i < size; i++) {
      int node = q.removeFirst();
      for (int neighbor in adjList[node]) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          q.add(neighbor);
          nodesReached++;
        }
      }
    }
    level++;
  }

  return nodesReached;
}

}
