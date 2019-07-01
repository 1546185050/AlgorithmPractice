/**
* 思路:1
* 最外层循环逐一从 nums 数组中取出每个元素 num
* 内层循环从原来的结果集中取出每个中间结果集，并向每个中间结果集中添加该 num 元素
* 往每个中间结果集中加入 num
* 将新的中间结果集加入结果集中
*/
public class Solution {
        public List<List<Integer>> subsets(int[] nums) {
            List<List<Integer>> res = new ArrayList<List<Integer>>();
            res.add(new ArrayList<Integer>());
            for (int num : nums) {  // ①从数组中取出每个元素
                int size = res.size();
                for (int i = 0; i < size; i++) {
                    List<Integer> temp = new ArrayList<>(res.get(i));  // ②逐一取出中间结果集
                    temp.add(num);  // ③将 num 放入中间结果集
                    res.add(temp);  // ④加入到结果集中
                }
            }
            return res;
        }
}