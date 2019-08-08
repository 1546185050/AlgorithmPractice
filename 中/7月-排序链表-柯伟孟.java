/**
*# 排序链表
*在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
*示例 1:
*输入: 4->2->1->3
*输出: 1->2->3->4
*示例 2:
*输入: -1->5->3->4->0
*输出: -1->0->3->4->5
*
*
*
* 按照题意，时间复杂度为O(n log n)，空间复杂度为常数级的排序：归并排序
* 思路：
* 1、寻找中间节点（用快慢指针）
* 2、分别对左部分和右部分递归排序
* 3、合并两个有序的链表
*
*/

class Solution {
    public ListNode sortList(ListNode head) {
       if(head == null || head.next == null) return head;
    
        //寻找中间节点（用快慢指针）
        ListNode slow = head;
        ListNode fast = head.next;
        while(fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
        }
        
        ListNode right = sortList(slow.next);
        slow.next = null;//把两个链表断开分为左边（包括middle）一半和右边一半
        ListNode left = sortList(head);
        
        return merge(left, right); 
    }
    
    //合并两个链表
    private ListNode merge(ListNode l1, ListNode l2) {
        if(l1 == null) return l2;
        if(l2 == null) return l1;
        
        if(l1.val < l2.val) {
            l1.next = merge(l1.next, l2);
            return l1;
        } else {
            l2.next = merge(l1, l2.next);
            return l2;
        }
    }
}