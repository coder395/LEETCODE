/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    
    *returnSize= 2;
    int* result = (int *)malloc(sizeof(int)*2);
    int l = numsSize;
    for(int i =0;i<l;i++)
    {
        for(int j =i+1;j<l;j++)
        {
            if(nums[i]+nums[j]==target)
            {
                result[0]=i;
                result[1]=j;
                return result;
            }

        }
    }
    free(result);
    return 0;

}