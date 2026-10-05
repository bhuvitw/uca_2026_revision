public class Main {
    public static void main(String[] args){
        String inp1 = "31*2+9-";
        String inp2 = "231*+9-";
        Solution solver = new Solution(); 

        System.out.println(solver.evaluatePostfix(inp2)); 
    }
}