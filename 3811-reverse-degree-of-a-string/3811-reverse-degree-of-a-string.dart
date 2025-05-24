class Solution {
  int reverseDegree(String s) {
    int o = 0;
    List<String> abcd = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    for(int i =0;i<s.length;i++){
        o += (abcd.indexOf(s[i])-26).abs() * (i+1);
    }

    return o;
  }
}