//
//  Insert.swift
//  20190427
//
//  Created by donghongping on 2019/8/30.
//  Copyright © 2019 com.GuangZhouXuanWu.iphoneEtion. All rights reserved.
//

import Foundation


class Solution {
    
    /**思路：考虑到区间列表无重叠、有序，首先初始化临时数组等于区间列表，遍历区间列表，通过与插入区间的边界值比较找出重叠区间合并后的左边界和右边界，并更新临时数组，
    然后遍历临时数组，遵循区间列表有序的原则，更新最后的结果
     **/
    
    /**测试用例：
     intervals = [[1,3],[6,9]], newInterval = [2,5]
     intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
     intervals = [[3,5],[6,7],[8,10]], newInterval = [1,12]
     **/
    
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        
        var left = newInterval[0]
        var right = newInterval[1]
        
        var tempArr = intervals
        
        for i in stride(from:intervals.count - 1, through:0, by:-1) {
            //不存在重复区间
            if intervals[i][0] > newInterval[1] || intervals[i][1] < newInterval[0] {
                continue
            }
            //有重复区间
            else {
                //左边界取较小值，右边界取较大值，并更新tempArr
                left = min(left,intervals[i][0])
                right = max(right,intervals[i][1])
                tempArr.remove(at:i)
            }
        }
        
        if tempArr.count == 0 {
            return [[left,right]]
        }
        
        for (index,temp) in tempArr.enumerated() {
            if temp[0] > right {
                tempArr.insert([left,right],at:index)
                break
            }
            //插入的新区间左边界大于现有区间最大值
            else if index == tempArr.count - 1 {
                tempArr.append([left,right])
            }
        }

        return tempArr
    }
    
}
