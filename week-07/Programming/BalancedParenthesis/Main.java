public class Main {
    public static void main(String[] args) {
        String inp1 = "[()]{}{()()}";
        String inp2 = "[()";

        Solution solver = new Solution(); 

        System.out.println(solver.isBalanced(inp2)); 
    }
}