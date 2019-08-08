//
//  main.swift
//  leetcode739
//
//  Created by xedp on 2019/7/30.
//  Copyright © 2019 xedp. All rights reserved.
//

import Foundation
/**
 根据每日 气温 列表，请重新生成一个列表，对应位置的输入是你需要再等待多久温度才会升高超过该日的天数。
 如果之后都不会升高，请在该位置用 0 来代替。
 例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，
 你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。
 提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。
 **/
class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: T.count)
        var stack = [Int]() // 当做栈的作用
        
        var index = 0
        for item in T {
            // 将不符合要求的数据压入栈中，然后从栈顶的后面往前面减，计算之前跳过的那些
            while stack.count != 0 && item > T[stack[stack.count - 1]] {
                let topIndex = stack[stack.count - 1]
                result[topIndex] = index - topIndex
                stack.remove(at: stack.count - 1)
            }
            stack.append(index)
            index += 1
        }
        return result
    }
}

print(Solution().dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]))
