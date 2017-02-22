/*
Given a linked list, swap every two adjacent nodes and return its head.

For example,
Given 1->2->3->4, you should return the list as 2->1->4->3.

Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
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
  func swapPairs(_ head: ListNode?) -> ListNode? {
    var fake = ListNode(0)
    fake.next = head
    var firstNode = fake
    var preNode: ListNode?
    var p = head

    var flag = false
    while p != nil {
      if flag {
        firstNode.next = p
        preNode!.next = p!.next
        p!.next = preNode
        firstNode = preNode!
        p = preNode
      } else {
        preNode = p
      }
      p = p!.next
      flag = !flag
    }

    return fake.next
  }
}