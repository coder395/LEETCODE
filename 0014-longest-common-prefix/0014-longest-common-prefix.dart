class Solution {
  String longestCommonPrefix(List<String> strs) {
    int length = 999;
    for(int i = 0; i < 999; i++){
        for(String elem in strs){
            if(elem.length == i){
                length = i;
                break;
            }
        }
        if(length < 999){
            break;
        }
    }

    String result = "";
   for(int i = 0; i < length; i++){
    List<String> list = [];
    for(String elem in strs){
        list.add(elem[i]);
    }
    if(list.toSet().length != 1){
        return result;
    }else{
        result+= list.first;
    }
   }
    return result;
  }
}