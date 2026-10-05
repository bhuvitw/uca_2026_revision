import java.util.*;

public class Solution{

    public int evaluatePostfix(String arr){
        Stack<Integer> st = new Stack<>(); 

        for(char c : arr.toCharArray()){
            if(Character.isDigit(c)){
                st.push(c - '0');
            }else{
                if(st.size() < 2){
                    return -1; 
                }
                int b = st.pop(); 
                int a = st.pop(); 

                switch (c) {
                    case '+': st.push(a+b); break; 
                    case '*': st.push(a*b); break;
                    case '/': st.push(a/b); break; 
                    case '-': st.push(a-b); break;
                    case '^': st.push((int) Math.pow(a,b)); break; 
                }
            }

        }

        return st.pop(); 
    }
}