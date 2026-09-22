public class SelectionSort {

    public void sort(int[] nums){
        Config config = new Config(); 

        int n = nums.length; 

        for(int i = 0; i<n; i++){
            int min = i; 
            for(int j = i; j<n; j++){
                if(nums[min] > nums[j]){
                    min = j; 
                }
            }
            if(min != i){
                config.swap(nums, min, i);
            }
        }


    }
}