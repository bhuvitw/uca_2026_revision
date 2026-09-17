public class Main{

    /* Interfaces 

    Game Plan

    - Seperate classes for each sort(~~BubbleSort~~, HeapSort, ~~InsertionSort~~, MergeSort, QuickSort, ~~SelectionSort~~) -> Study these first 


    */
    

    
    public static void main(String[] args){
        int[] test = {25,23,45,2345,2,45,243,1,1,4,5,3245,3};

        // SelectionSort solve = new SelectionSort(); 
        // BubbleSort solve = new BubbleSort(); 
        InsertionSort solve = new InsertionSort(); 

        solve.sort(test); 

        for(int n : test)
            System.out.print(n + " "); 

        System.out.println(); 
    }
}