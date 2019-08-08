/**
 * 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 * 示例 1:

 * 输入: 4->2->1->3
 * 输出: 1->2->3->4
 * 示例 2:

 * 输入: -1->5->3->4->0
 * 输出: -1->0->3->4->5
 *  
 * */

 /**
  * 分析：几种常见的排序方法：冒泡， 插入， 选择， 快速， 归并， 希尔
  * 时间及空间复杂度：n2/1, n2/1, n2/1, nlog2n/nlog2n, nlog2n/n, n2/1
  * 题目要求时间复杂度为：nlog2n，只能从快速和归并里选择，常数级空间又是链表，这里可以使用归并排序方法 
  *
  * 归并排序思路：归并排序就是将多个有序表合并成一个有序表，一般使用二路合并，就是两个有序表合并成一个有序表。
  * 1.链表不为空的情况下，定义两个指针，f1, f2, f1<f2，找到链表的中间位置，截断链表
  * 2.对截断的两段链表递归排序做同样的操作
  * 3.然后对两端有序的链表进行合并即为最后有序列表
  */
 
  public class ListNode {
      int val;
      LinkNode next;
      ListNode(int x) {
          val = x;
      }
  }
  class Solution {
      public ListNode sortList(ListNode head) {
          if(head == null || head.next == null) {
              return head;
          }
          // 找中间位置
          ListNode f1 = head;
          ListNode f2 = head;
          while(f2.next != null && f2.next.next !=null) {
              f2 = f2.next.next;
              f1 = f1.next;
          }
          // left左半截
          ListNode left = head;
          // right右半截
          ListNode right = f1.next;
          // 断掉链表
          f1 = null;
          // 左右链表排序
          ListNode left1 = sortList(head);
          ListNode right1 = sortRight(f1);
          // 合并左右
          ListNode mergeHead = merge(left1, right1);
          return mergeHead;
      }

      public ListNode merge(ListNode left, ListNode right) {
          if(left == null) {
              return right;
          }
          if(right == null) {
              return left;
          }
          if(left.val < right.val) {
              left.next = merge(left.next, right);
              return left;
          }
          right.next = merge(left, right.next);
          return right;
      }
  }