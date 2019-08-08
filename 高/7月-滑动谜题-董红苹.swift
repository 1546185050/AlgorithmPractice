//
//  SlidingPuzzle.swift
//  20190427
//
//  Created by donghongping on 2019/7/28.
//  Copyright © 2019 com.GuangZhouXuanWu.iphoneEtion. All rights reserved.
//

import Foundation

class Solution {
    /**
     思路：BFS遍历问题
     1.使用一个集合visitedBoards存储遍历过的二维数组，避免重复执行，数组tempQueue存储二维数组中间状态和0元素所在的位置
     2.然后就是按层遍历，取出tempQueue的第一个元素，先和正确目标比较，相同就直接返回步数；
     否则将0和其中一个相邻元素进行交换，生成一个新的二维数组，如果这个二维数组没有被遍历过，则加入到队列tempQueue，且移动次数加1
     3.若循环结束还到不了正确结果，返回-1
     **/
    
    /**
     测试用例：
     [[1,2,3],[4,0,5]]
     [[4,1,2],[5,0,3]]
     [[1,2,3],[5,4,0]]
     **/
    func slidingPuzzle(_ board: [[Int]]) -> Int {
        
        var changeNum = 0
        
        let correctBoard = [[1, 2, 3],[4, 5, 0]]
        let directions = [(0, -1),(-1, 0),(0, 1),(1, 0)]
        
        //多维数组型集合，存储已遍历过的二维数组，避免重复执行
        var visitedBoards = Set<[[Int]]>()
        
        //元组型数组，元组存储二维数组和0元素所在的位置
        var tempQueue = [([[Int]],(Int, Int))]()
        
        for i in 0..<board.count {
            for j in 0..<board.first!.count {
                if board[i][j] == 0 {
                    //(i, j)为0元素所在位置
                    tempQueue.append((board, (i, j)))
                }
            }
        }
        
        while(!tempQueue.isEmpty) {
            
            for _ in stride(from:tempQueue.count - 1,through:0,by:-1) {
                
                let t:[[Int]] = tempQueue.first!.0
                
                //元素0所在位置
                let zeroPos:(Int, Int) = tempQueue.first!.1
                
                tempQueue.removeFirst()
                //与正确的结果进行比较
                if t == correctBoard {
                    return changeNum
                }
                visitedBoards.insert(t)
                
                //遍历前后左右四个方向
                for dir in directions{
                    let x:Int = zeroPos.0 + dir.0
                    let y:Int = zeroPos.1 + dir.1
                    
                    //2*3作为边界
                    if x < 0 || x >= 2 || y < 0 || y >= 3 {
                        continue
                    }
                    
                    var cand:[[Int]] = t
                    //0与相邻元素交换位置
                    cand[zeroPos.0][zeroPos.1] = cand[x][y]
                    cand[x][y] = 0
                    
                    //之前未遍历过的，加到tempQueue中
                    if visitedBoards.contains(cand) == false {
                        tempQueue.append((cand,(x,y)))
                    }
                }
            }
            changeNum += 1
        }
        return -1
    }
}
