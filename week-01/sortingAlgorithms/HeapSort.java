public class HeapSort {
    public void sort(int[] nums){
        Config config = new Config(); 
        int n = nums.length; 
        for(int i = n/2 - 1; i>0; i--){
            heapify(nums, n, i); 
        }

        for(int i = n-1; i>0; i--) {
            config.swap(nums, 0, i); 
            heapify(nums, i, 0); 
        }
    }

    private void heapify(int[] nums, int size, int root) {
        Config config = new Config(); 

        int largest = root; 
        int leftChild = 2 * root + 1; 
        int rightChild = 2 * root + 2; 

        // If left child exists and greater than current largest
        if(leftChild < size && nums[leftChild] > nums[largest]){
            largest = leftChild; 
        }

        // If right child exists and greater than current largest{
        if(leftChild < size && nums[rightChild] > nums[largest]) {
            largest = rightChild; 
        }

        // If largest is not root, swap and continue heapify downward
        if(largest != root){
            config.swap(nums, root, largest); 
            heapify(nums, size, largest); 
        }

    }   
}