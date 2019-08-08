//
//  Wordbreak.swift
//  20190427
//
//  Created by donghongping on 2019/7/27.
//  Copyright © 2019 com.GuangZhouXuanWu.iphoneEtion. All rights reserved.
//

import Foundation

class Solution {
    
    /**
     思路：动态规划问题
     1.初始化长度为s.count + 1的布尔型数组dp，其中dp[0]=true，考虑空字符串的问题
     2.用下标i取字符串s从头开始的可能的子串，然后使用下标j将子串进行拆分s[0,j],s[j,i]
     3.两层遍历，如果子串s[0,j]满足题目要求，且s[j,i]也在字典中，则设置dp[i]为true
     4.最后返回dp[s.count]
     **/
    
    /**
     测试用例：
     "leetcode"  ["leet","code"]
     "applepenapple"  ["apple", "pen"]
     "catsandog"  ["cats", "dog", "sand", "and", "cat"]
     **/
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = [Bool]()
        
        dp = [Bool](repeatElement(false, count: s.count))
        dp.insert(true, at: 0)
        
        for i in 1...s.count {
            for j in 0..<i {
                let start = s.index(s.startIndex, offsetBy: j)
                let end = s.index(s.startIndex, offsetBy: i)
                if dp[j] == true, wordDict.contains(String(s[start..<end])) {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[s.count]
    }
}

