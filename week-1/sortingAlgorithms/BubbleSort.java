public class BubbleSort {
    public void sort(int[] nums){
        Config config = new Config(); 
        int n = nums.length; 
        for(int i = 0; i<n; i++){
            for(int j = i; j<n; j++){
                if(nums[i] > nums[j]){
                    config.swap(nums, i, j); 
                }
            }
        }
    }
}