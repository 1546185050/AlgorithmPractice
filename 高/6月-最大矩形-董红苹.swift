//
//  maximalRectangle.swift
//  20190427
//
//  Created by donghongping on 2019/6/30.
//  Copyright © 2019 com.GuangZhouXuanWu.iphoneEtion. All rights reserved.
//

import Foundation

class Solution {
    /**
     思路：动态规划问题，可以概括为求符合条件的最大子矩阵。
     1.构建二维数组tempArr，存储当前节点的横向，即可以看做横向的柱状图，问题转化为求该柱状图的最大公共矩形
     2.对tempArr行列进行遍历,并利用栈的思想，stack保存当前元素的列index，若当前元素比栈顶元素小，那么栈顶元素弹出，直到栈顶元素小于当前元素或栈为空，保证栈顶元素存储的是最小高度,对应围成的矩形满足只包含1的条件
     3.计算宽高、面积，取最大值
    **/
    
    /**
    测试用例：
     [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
     [["1","0","1","1","0"],["1","0","1","1","1"]]
     [["1"]]
     **/
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 else {
            return 0
        }
        guard matrix[0].count > 0 else {
            return 0
        }
        
        //构建二维数组，存储当前节点的横向，即可以看做横向的柱状图，其中高度matrix.count + 1兼容行数等于一的情况
        var tmpArr = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count + 1)
        
        for i in 0..<matrix.count {
            var height = 0
            
            for j in 0..<matrix[0].count {
                if matrix[i][j] == "1" {
                    height += 1
                }
                else {
                    height = 0
                }
                tmpArr[i][j] = height
            }
        }
        
        var stack = [Int]()
        
        var maxRectangle = 0
        
        //柱状图是横向的，所以存在转换关系：以矩阵列维度作为宽度，行维度作为高度
        for i in 0..<tmpArr[0].count {
            for j in 0..<tmpArr.count {
                //利用栈的思想，stack保存当前元素的列index，若当前元素比栈顶元素小，那么栈顶元素弹出，直到栈顶元素小于当前元素或栈为空
                //这样可以保证栈顶元素存储的是最小高度,对应围成的矩形满足只包含1
                while stack.count > 0, tmpArr[stack.last!][i] >= tmpArr[j][i] {
                    let h = tmpArr[stack.removeLast()][i]
                    let w = stack.count > 0 ? j - 1 - stack.last!: j
                    
                    maxRectangle = max(maxRectangle, w * h)
                }
                stack.append(j)
            }
            stack.removeAll()
        }
        
        return maxRectangle
    }
}
