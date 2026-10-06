public class Main {
    public static void main(String[] args) {

        int[] arr = {7, 2, 9, 4, 1, 6, 3, 8, 5};
        int k = 20;

        Solution solution = new Solution();

        int[] result = solution.selectSmallestK(arr, k);

        for (int x : result) {
            System.out.print(x + " ");
        }
        System.out.println();
    }
}