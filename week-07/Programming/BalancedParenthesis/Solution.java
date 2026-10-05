public class Solution {

    int i = 0;
    public boolean isBalanced(String s) {
        boolean result =  helper(s, '\0');

        return result && i == s.length(); 
    }
    private boolean helper(String s, char expected){


        while(i < s.length()){
            char current = s.charAt(i); 

            if(current == '{'){
                i++; 
                if(!helper(s, '}')) return false; 
            }else if(current == '['){
                i++; 
                if(!helper(s, ']')) return false; 
            }else if(current == '('){
                i++; 
                if(!helper(s, ')')) return false; 
            }

            else {
                if(current == expected){
                    i++; 
                    return true; 
                }else{
                    return false; 
                }
            }
        }

        return expected == '\0';
    }
}
