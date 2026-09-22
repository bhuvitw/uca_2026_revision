public class InsertionSort{
    public void sort(int[] nums){
        Config config = new Config(); 

        int n = nums.length; 
        for(int i = 1; i<n; i++){
            for(int j = i; j>0; j--){
                if(nums[j]>nums[j-1]){
                    break; 
                } else {
                    config.swap(nums,j,j-1); 
                }
            }
        }
    }
}