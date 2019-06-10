Definition for a binary tree node.
    struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};
 
 //找到最大值，创建一个根结点，然后将左右两个子数组提取出来，分别调用递归函数并将结果连到该结点上，最后将结点返回
struct TreeNode* constructMaximumBinaryTree(int* nums, int numsSize) {
    int i=0;
    int max=nums[0];
    if(numsSize==0)
        return NULL;
    for(int j=0;j<numsSize;j++){
        if(nums[j]>max)
            max=nums[j];
    }
    for(;nums[i]!=max;i++);
    struct TreeNode* root=(struct TreeNode*)malloc(sizeof(struct TreeNode));
    root->val=nums[i];
    root->left=constructMaximumBinaryTree(nums,i);
    root->right=constructMaximumBinaryTree(nums+i+1,numsSize-i-1);
    return root;
}