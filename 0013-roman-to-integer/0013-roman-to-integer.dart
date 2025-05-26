class Solution {
  int romanToInt(String s) {
    int result = 0;
    int ans =0;
    for (int i = s.length -1;i>=0;i--){
        switch(s[i]){
            case 'I':
                result  = 1;
                break;
            case 'V':
                result =5;
                break;
            case 'X':
                result =10;
                break;
            case 'L':
                result =50;
                break;
            case 'C':
                result =100;
                break;
            case 'D':
                result =500;
                break;
            case 'M':
                result =1000;
                break;
        }
        if(4*result < ans) ans-= result;
        else ans += result;
    }
    return ans;
    
  }
}