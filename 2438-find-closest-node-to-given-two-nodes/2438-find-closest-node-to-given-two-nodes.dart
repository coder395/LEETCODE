class Solution {
  int closestMeetingNode(List<int> edges, int node1, int node2) {
    List<int> dist1 = getDistances(edges, node1);
    List<int> dist2 = getDistances(edges, node2);

    int result = -1;
    int minDistance = 1 << 30;

    for (int i = 0; i < edges.length; i++) {
      if (dist1[i] != -1 && dist2[i] != -1) {
        int maxDist = dist1[i] > dist2[i] ? dist1[i] : dist2[i];
        if (maxDist < minDistance) {
          minDistance = maxDist;
          result = i;
        }
      }
    }
    return result;
  }

  List<int> getDistances(List<int> edges, int start) {
    int n = edges.length;
    List<int> dist = List.filled(n, -1);
    int d = 0;
    while (start != -1 && dist[start] == -1) {
      dist[start] = d++;
      start = edges[start];
    }
    return dist;
  }
}