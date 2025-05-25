class Solution {
  int reverse(int x) {
        int duplicate = x.abs();
        int dn = 0;
        int mn =0;
        while(duplicate > 0){
            dn = duplicate % 10;
            mn = mn *10 + dn;
            duplicate  =  duplicate ~/ 10;

        }
        if(mn <= -2147483648 || mn > 2147483648){
            return 0;
        }
        else{
            if(x<0){
                int final_value = mn * (-1);
                return final_value;
            }
            else{
                    return mn;
                
            }
        }
    }

  }
