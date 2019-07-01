/*
子集
给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

说明：解集不能包含重复的子集。

示例:

输入: nums = [1,2,3]
输出:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
*/
/*
*分析：求一个数n的子集数，就是这个数的2的n次幂
*思路：回溯算法思想，采用递归实现，在每个索引中，都有一个选择值的选项，子集总数有2*2*2.。。。=2的n
*次幂，定义暂存列表list，当前列表current_list,每次递归调用时，传递检查索引和数组length，相等情况
*下，将current_list暂存在list中，承接当前子集current_list，最后将对应的索引的current_list放入
*超集当中即可
*用例 nums= [1,2,3]
*/

import java.util.List;
import java.util.LinkedList;

class Solution {
    public List<List<Integer>> subsets(int[] arr) {
        List<List<Integer>> list = new LinkedList<>();
        backtrack(arr, 0, list, new LinkedList<>());
        return list;
    }
    
    private void backtrack(int[] arr, int index, List<List<Integer>> list, List<Integer> current_list){
        if(arr.length == index){
            list.add(current_list);
            return;
        }
        
        List<Integer> list_linked = new LinkedList<>(current_list);
        list_linked.add(arr[index]);

        backtrack(arr, index + 1, list, current_list);
        backtrack(arr, index + 1, list, list_linked);
    }
    
}
