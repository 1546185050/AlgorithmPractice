//
//  main.swift
//  Leetcode143
//
//  Created by xedp on 2019/7/30.
//  Copyright © 2019 xedp. All rights reserved.
//

import Foundation

/**
 148 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 输入: 4->2->1->3
 输出: 1->2->3->4
 
 输入: -1->5->3->4->0
 输出: -1->0->3->4->5
 
 解题分析：
 要点：
 1、时间复杂度：O(n log n)
 2、常数级空间复杂度
 
 常用排序算法中可以达到上述要求的为
 1、满足时间复杂度：堆排序、快速排序（平均情况下） 归并排序
 2、同时满足空间复杂度：堆排序、归并排序
 
 以下选择归并排序作为解决问题的方法
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        return sort(head)
    }
    
    func sort(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil{
            return head
        }
        var p1 = head
        var p2 = head?.next
        //通过P2两倍速于P1的方式遍历，找到链表的中间位置
        while p2 != nil {
            p2 = p2?.next
            if p2 == nil{
                break
            }
            p2 = p2?.next
            p1 = p1?.next
        }
        
        //中点右侧数据
        p2 = p1?.next
        p1?.next = nil
        p1 = head
        
        p1 = sort(p1)
        p2 = sort(p2)
        return merge(left: p1, right: p2)
    }
    
    
    func merge(left: ListNode?, right: ListNode?) -> ListNode? {
        if left == nil{
            return right
        }
        
        if right == nil{
            return left
        }
        
        if let leftValue = left?.val, let rightValue = right?.val, leftValue <= rightValue {
            left?.next = merge(left: left?.next, right: right)
            return left
        }else{
            right?.next = merge(left: left, right: right?.next)
            return right
        }
    }
}


