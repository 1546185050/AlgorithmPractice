//
//  CarPooling.swift
//  20190427
//
//  Created by donghongping on 2019/8/29.
//  Copyright © 2019 com.GuangZhouXuanWu.iphoneEtion. All rights reserved.
//

import Foundation

class Solution {
    /**思路：遵循”先下后上“的原则，判断前一波乘客还没有下车+后一波乘客已上车的情况下，即交叉区间内是否超载。
     首先找出最后的下车点last，初始化元素为0、元素个数为last+1的数组;
     然后遍历行程计划表数组，计算每一个上下车点的乘客数，交叉点如果乘客数大于座位数，返回false，否则返回true
     **/
    
    /**测试用例：
     [[2,1,5],[3,3,7]]
     [[2,1,5],[3,3,7]]
     [[3,2,7],[3,7,9],[8,3,9]]
     **/
    
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        let sortedTrips = trips.sorted { $0[2] < $1[2]}
        let last = sortedTrips.last![2]

        //每一个上车点的乘客数数组
        var curCapacityArr = Array(repeating: 0, count: last + 1)
        
        for trip in trips {
            //在trip[2]这一点是下车点，“先下后上”，改点的乘客数不参与累加计算
            for point in trip[1]..<trip[2] {
                curCapacityArr[point] += trip[0]
                if curCapacityArr[point] > capacity {
                    return false
                }
            }
        }
        return true
    }
}
