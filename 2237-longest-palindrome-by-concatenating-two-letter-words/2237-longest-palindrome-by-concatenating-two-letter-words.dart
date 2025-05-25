class Solution {
  int longestPalindrome(List<String> words) {
    final wordCount = <String,int>{};
    int length = 0;
    int central = 0;
    for(final word in words){
        wordCount[word] = (wordCount[word]??0)+1;

    }
    for (final entry in wordCount.entries){
        final word = entry.key;
        final count = entry.value;
        if(word[0]==word[1]){
            if(count%2 == 0){
                length += count*2;
            }else{
                length += (count-1)*2;
                central = 2;
            }
        }else{
            final reversedWord = String.fromCharCodes(word.codeUnits.reversed);
            if(wordCount.containsKey(reversedWord)){
                final minCount = count < wordCount[reversedWord]! ? count:wordCount[reversedWord]!;
                length += minCount *4;
                wordCount[word] = 0;
                wordCount[reversedWord] = 0;
            }
        }
    }
    return length+central;
  }
}