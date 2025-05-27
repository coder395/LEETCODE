class Solution {
  String longestPalindrome(String s) {
    if (s.length < 2) return s;
    int start = 0, maxLen = 1;

    // Helper: expand around left/right and update max window
    void expand(int left, int right) {
        while (left >= 0 && right < s.length && s[left] == s[right]) {
            int currLen = right - left + 1;
            if (currLen > maxLen) {
                start = left;
                maxLen = currLen;
            }
            left--;
            right++;
        }
    }

    for (int i = 0; i < s.length; i++) {
        // Odd-length palindrome (center at i)
        expand(i, i);
        // Even-length palindrome (center between i and i+1)
        expand(i, i + 1);
    }

    return s.substring(start, start + maxLen);
  }
}