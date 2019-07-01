//
//  BurstBalloons.swift
//  20190427
//
//  Created by donghongping on 2019/6/28.
//  Copyright © 2019 com.GuangZhouXuanWu.iphoneEtion. All rights reserved.
//

import Foundation

class Solution {
    /**
    思路：利用动态规划算法，戳气球得硬币的动态转移方程可以概括为：
    dp[left][right]表示nums[left...right]戳气球得硬币的最大值,则dp[left][right] = max(dp[left][right], nums[left - 1] * nums[k] * nums[right + 1] + dp[left][k - 1] + dp[k + 1][right]),其中left < k < right.
    另外，会有三层嵌套循环执行
     **/
    
    //测试用例：[3,1,5,8], [1,2,3,4], []
    
    func maxCoins(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var newNums = nums
        newNums.insert(1, at: 0)
        newNums.append(1)
        
        var dp = Array(repeating: Array(repeating: 0, count: newNums.count), count: newNums.count)
        
        for i in 1...nums.count {
            for left in 1...nums.count - i + 1 {
                let right = left + i - 1
                for k in left...right {
                    dp[left][right] = max(dp[left][right], newNums[left - 1] * newNums[k] * newNums[right + 1] + dp[left][k - 1] + dp[k + 1][right])
                }
            }
        }
        
        return dp[1][nums.count]
    }
}


