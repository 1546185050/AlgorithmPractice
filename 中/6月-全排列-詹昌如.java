6月-全排列-詹昌如
/*
全排列
给定一个没有重复数字的序列，返回其所有可能的全排列。

示例:

输入: [1,2,3]
输出:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
*/
/*
*分析：n个不重复的数，可能的全排列有n!个。
*思路：回溯算法思想，采用递归实现，如果每次选定一个数固定，例如：1,2,3，选定1，固定，2,3有两种组合方式，即2，3或3,2，可以看出，固定一个开始的数，后面的数做个交换，如此递归下去就可以求出全部数的全排列了
*此外，如果定义一个list用来保存全排列，就可以做到，不论是重复还是不重复的数，都可以用改算法求解，如果是重复的数，在list中可以删除相同的排列即可
*用例：num = [1,2,3] 
*/

import java.util.List;
import java.util.ArrayList;

class Solution {
	public List<List<Integer>> permute(int[] arr) {
		return helper(arr, arr.length, arr.length);
	}
	public List<List<Integer>> result = new ArrayList<List<Integer>>();// 保存全排列，如果有重复数字，这里也可以删除重复排列
	public List<List<Integer>> helper(int[] arr, int n, int k) {
		if (k == 1) {
			List<Integer> list = new ArrayList<>();
			for (int i = 0; i < n; i++) {
				list.add(arr[i]);
			}
			result.add(list);// 保存到result
		}
		for (int i = 0; i < k; i++) {
			//swap(arr, n, k - 1);
            int temp = arr[i];
			arr[i] = arr[k - 1];
			arr[k - 1] = temp;
			helper(arr, n, k - 1);
			//swap(arr, n, k - 1);		 
            temp = arr[i];
			arr[i] = arr[k - 1];
			arr[k - 1] = temp;
		}
		return result;
	}
	/*
	public void swap(int[] num, int i, int j) {// 交换
		int temp = num[i];
		num[i] = num[j];
		num[j] = temp;
	}*/
}