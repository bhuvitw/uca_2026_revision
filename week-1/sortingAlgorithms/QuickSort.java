public class QuickSort {
    public void sort(int[] nums){
        quickSort(nums, 0, nums.length-1); 
    }
    private void quickSort(int[] nums, int left, int right){
        if(left<right){
            int pivot = Partition(nums, left, right); 

            quickSort(nums, left, pivot-1); 
            quickSort(nums, pivot+1, right); 
        }
    }

    private int Partition(int[] nums, int left, int right){
        Config config = new Config(); 
        int pivot = nums[left]; 
        int leftWall = left; 

        for(int i = left+1; i<=right; i++){
            if(nums[i] < pivot){
                leftWall++; 
                config.swap(nums, leftWall, i); 
            }
        }

        config.swap(nums, left, leftWall); 
        return leftWall; 
    }
}