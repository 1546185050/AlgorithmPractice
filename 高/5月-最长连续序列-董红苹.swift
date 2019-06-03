//
//  longest.swift
//  20190427
//
//  Created by donghongping on 2019/5/18.
//  Copyright © 2019年 com.GuangZhouXuanWu.iphoneEtion. All rights reserved.
//

import Foundation

class Solution {
    //思路：用一个数据字典存储数组nums元素，然后遍历数组nums，如果字典中存在这个数字n，就向左右（减一和加一）两个方向寻找相邻值是否在字典中，如果在则当前长度自增1，为防止重复查找，同步从字典中删除这个元素
    //测试用例：[0],[100, 4, 200, 1, 3, 2]，[5, 100, 4, 200, 6, 1, 3, 2]，[-4,-4,2,-6,9,6,8,-6,-9,-1,9,5,2,-6,0]
    func longestConsecutive(_ nums: [Int]) -> Int {
        
        var longest = 0
        
        var numsDic = [Int : Int]()
        for i in 0..<nums.count {
            numsDic[nums[i]] = i
        }
        

        var left = 0
        var right = 0
        var len = 0

        for n in nums {
            guard numsDic[n] != nil else {
                continue
            }

            left = n - 1
            right = n + 1
            len = 0
            
            numsDic.removeValue(forKey: n)

            while numsDic[left] != nil {
                len += 1
                numsDic.removeValue(forKey: left)
                left -= 1
            }
            
            while numsDic[right] != nil {
                len += 1
                numsDic.removeValue(forKey: right)
                right += 1
            }
            
            longest = max(longest, len + 1)
            
        }
        
        return longest
    }
}


