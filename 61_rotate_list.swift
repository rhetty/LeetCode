/*
Given a list, rotate the list to the right by k places, where k is non-negative.

For example:
Given 1->2->3->4->5->NULL and k = 2,
return 4->5->1->2->3->NULL.
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
  func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil { return nil }
    if k == 0 { return head }

    var p = head
    var tail = p
    var n = 1

    while tail!.next != nil {
      tail = tail!.next
      n += 1
    }

    let move = n - k % n

    if move == n {
      return head
    }

    for i in 0 ..< move - 1 {
      p = p!.next
    }

    let nHead = p!.next
    p!.next = nil
    tail!.next = head

    return nHead
  }
}