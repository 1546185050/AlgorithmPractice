/*
# 每日温度
*
*根据每日 气温 列表，请重新生成一个列表，对应位置的输入是你需要再等待多久温度才会升高超过该日的天数。如果之后都不会升高，请在该位置用 0 来代替。
*例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。
*提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。
*
*
* 这个问题第一眼看到想到的解法是，从前往后两个遍历，温度升高下标相减。得到最后的结果
* 这样未免太简单，应该有其他更优解。
* 更优解：从后往前遍历，建立一个存放数组元素下标的栈（下标可以用来计算位置差，同时作为温度列表的下标便于查找）
* 最后一天，栈为空，栈中无比73更大的值，res[7]=0;73入栈
* 倒数第二天，76大于73，说明后面无更高温度，73出栈，res[6]=0;76入栈
* 倒数第三天，72小于76（和栈顶比较），出现第一个高的温度，下标相减，res[5]=6-5=1,72入栈
* 以此类推.....
*/
public int[] dailyTemperatures(int[] temperatures) {
       int[] res = new int[temperatures.length];
       Stack<Integer> stack = new Stack<>();
       for (int i =temperatures.length-1;i>=0; i--){
           while (!stack.isEmpty()&&temperatures[i]>=temperatures[stack.peek()])
               stack.pop();
           if(stack.isEmpty())
               res[i] = 0;
           else
               res[i] = stack.peek()-i;
           stack.push(i);
        }
       return res;
}