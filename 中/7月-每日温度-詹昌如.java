 /**
 * 根据每日 气温 列表，请重新生成一个列表，对应位置的输入是你需要再等待多久温度才会升高超过该日的天数。如果之后都不会升高，请在该位置用 0 来代替。

 * 例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。

 * 提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。
 * 
 * */

/**
 * 思路：对列表进行遍历，定义一个计算器count, 对于任意的i位数，查找后面比i位大的数，记录加1
 */

 class Solution {
     public int[] dailyTemperatures(int[] T) {
         int[] arr = new int[T.length];
         // 列表为空
         if(T.length == 0) {
             return arr;
         }
         // 循环遍历链表，比较前后大小并记录
         for(int i = 0; i < T.length; i++) {
             int count = 0;
             for(int j = i + 1; j < T.length; j++) {
                 count += 1;
                 if(T[j] > T[i]) {
                     arr[i] = count;
                     break;
                 }
             }
         }
         return arr;
     }
 }