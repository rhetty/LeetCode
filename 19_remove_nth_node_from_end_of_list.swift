/*
Given a linked list, remove the nth node from the end of list and return its head.

For example,

   Given linked list: 1->2->3->4->5, and n = 2.

   After removing the second node from the end, the linked list becomes 1->2->3->5.
Note:
Given n will always be valid.
Try to do this in one pass.
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    if head == nil {
      return nil
    }
    var p = head
    var array = [ListNode]()
    repeat {
      array.append(p!)
      p = p!.next
    } while p != nil

    let count = array.count
    if count == n {
      return head!.next
    } else if n == 1 {
      array[count - n - 1].next = nil
    } else {
      array[count - n - 1].next = array[count - n + 1]
    }
    return head
  }
}