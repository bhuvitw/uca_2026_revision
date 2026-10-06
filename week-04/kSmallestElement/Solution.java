public class Solution {
    
    private void swap(int[] arr, int i, int j) {
        int temp = arr[i]; 
        arr[i] = arr[j]; 
        arr[j] = temp; 
    }

    private void quickSelect(int[] arr, int left, int right, int target){

        while(left <= right) {
            int pivot = partition(arr, left, right); 

            if(pivot == target){
                return;
            } 
            
            if(pivot > target) {
                right = pivot-1; 
            } else {
                left = pivot+1; 
            }
        }
    }

    // Lumito Partition version 
    private int partition(int[] arr, int left, int right) {

        // last ele as pivot
        int pivot = arr[right]; 

        // boundary of ele smaller then pivot
        int j =left; 
        
        for(int i = left; i<right; i++) {
            if(arr[i] < pivot){
                swap(arr, i, j); 
                j++; 
            }
        }

        swap(arr, j, right); 

        return j; 
    }

    public int[] selectSmallestK(int[] arr, int k) {
        if(k <= 0 || k > arr.length){
            throw new IllegalArgumentException("k must be between 1 and array length");
        }
        int target = k -1 ; 

        quickSelect(arr, 0, arr.length -1, target); 

        int[] res = new int[k];

        for(int i = 0; i<k; i++){
            res[i] = arr[i]; 
        }

        return res; 
    }
}