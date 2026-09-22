public class MergeSort {
    public void sort(int[] nums){
        splitter(nums, 0, nums.length-1); 
    }

    private void splitter(int[] nums, int i, int j){
        if(i>=j){
            return; 
        }

        int mid = i + (j-i)/2; 

        splitter(nums, i, mid); 
        splitter(nums, mid+1, j); 

        merger(nums, i, mid, j); 
    }

    private void merger(int[] nums, int i, int mid, int j){
        int p1 = i; 
        int p2 = mid+1; 

        while(p1<=mid && p2<=j){
            if(nums[p1]<=nums[p2]){
                p1++; 
            }else{
                int val = nums[p2]; 
                int index = p2; 

                while(index != p1){
                    nums[index] = nums[index-1]; 
                    index--; 
                }

                nums[p1] = val; 

                mid++; 
                p2++; 
                p1++; 
            }
        }
    }
}