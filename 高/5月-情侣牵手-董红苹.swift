//
//  minSwapsCouples.swift
//  20190427
//
//  Created by donghongping on 2019/5/26.
//  Copyright © 2019年 com.GuangZhouXuanWu.iphoneEtion. All rights reserved.
//

import Foundation

class Solution {
    
    //思路：首先用一个字典记录数组元素的下标，然后以步长为2的方式遍历执行：查找数组元素的couple的下标，该下标与index+1不相等则交换位置
    //输入用例：[0,2,1,3]   [3, 2, 0, 1]  [3, 5, 2, 0, 4, 1]
    
    func minSwapsCouples(_ row: [Int]) -> Int {
        var rowDic = [Int : Int]()
        
        var rowCopy = row
        
        var swapCount = 0
        
        for i in 0..<row.count {
            rowDic[row[i]] = i
        }
        
        var couple = 0
        
        for j in stride(from: 0, to: row.count, by: 2) {
            //相邻方式：奇数偶数 或 偶数奇数
            couple = rowCopy[j] % 2 == 0 ? rowCopy[j] + 1 : rowCopy[j] - 1
            //couple的下标与j+1不相等则交换位置
            if let n = rowDic[couple], n != (j + 1) {
                rowDic[rowCopy[n]] = j + 1
                rowDic[rowCopy[j + 1]] = n
                rowCopy.swapAt(n, j + 1)
                swapCount += 1
            }
        }
        return swapCount
    }
}
