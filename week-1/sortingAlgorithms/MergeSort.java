public class MergeSort{
    public void merge(int[] nums){
        splitter(nums, 0, nums.length()-1); 
    }

    public void splitter(){
        if(i>=j){
            return; 
        }

        int mid = (i+j)/2; 

        splitter(nums, i, mid);
        splitter(nums, mid+1, j); 

        merger(nums, i, mid, j);  
    }

    public void merger(int[] nums, int i, int mid, int j){
        
    }
}