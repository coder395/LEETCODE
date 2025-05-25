class Solution {
  bool isPalindrome(int x) {
    if(x < 0 ){
        return false;
    }
    else{
        int duplicate = x;
        int dn =0;
        int mn = 0;
        
        while(x>0){
            dn = x%10;
            mn = mn*10 + dn;
            x = x ~/ 10;
        }
        if(duplicate == mn ){
            return true;
        }
        else{
            return false;
        }

        }

    
  }
}