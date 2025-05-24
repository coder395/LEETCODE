class Solution {
  int scoreOfString(String s) {
    int m =0;
    for(int i =0;i<s.length;i++){
        if(i != s.length-1){
            if(s.codeUnitAt(i)>s.codeUnitAt(i+1)){
                m += s.codeUnitAt(i) - s.codeUnitAt(i+1);

            }
            else{
                m += s.codeUnitAt(i+1) - s.codeUnitAt(i);
            }

        }
    }
    return m;
}
}