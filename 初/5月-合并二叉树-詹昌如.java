/*
给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。

你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL 的节点将直接作为新二叉树的节点。

给出一个非空有效字符串 S，考虑将其进行原语化分解，使得：S = P_1 + P_2 + ... + P_k，其中 P_i 是有效括号字符串原语。

对 S 进行原语化分解，删除分解中每个原语字符串的最外层括号，返回 S 。

示例 1:

输入: 
	Tree 1                     Tree 2                  
          1                         2                             
         / \                       / \                            
        3   2                     1   3                        
       /                           \   \                      
      5                             4   7                  
输出: 
合并后的树:
	     3
	    / \
	   4   5
	  / \   \ 
	 5   4   7

*/

// 本题疑问：题目后面两句话，不是太理解，是多余的？

/*
*解题思路：本地是要合并两个二叉树T1,T2，所以就会涉及到对二叉树的遍历，遍历过程中采用递归
*二叉树的遍历方式有：先序，中序，后序，深度，广度。
*本题采用先序遍历，然后对二叉树的左子树和右子数递归遍历。
*分为几种情况：1.如果树T1,T2都为空，return null
*2.如果T1为空，return T2
*3.吐过T2为空，return T1
*4.如果都不为空，则T1 + T2
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public TreeNode mergeTwoTreesTogether(TreeNode t1, TreeNode t2) {
        if(t1 == null && t2 == null) {
			return null;
		} else if (t1 == null && t2 != null) {
			return t2;
		} else if (t1 != null && t2 == null) {
			return t1;
		} else {
			t1.val += t2.val;
			t1.left = mergeTwoTreesTogether(t1.left, t2.left);
			t1.right = mergeTwoTreesTogether(t1.right, t2.right);
			return t1;
		}
    }
}