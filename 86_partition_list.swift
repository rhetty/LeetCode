/*
Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.

For example,
Given 1->4->3->2->5->2 and x = 3,
return 1->2->2->4->3->5.
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var lhead: ListNode? = nil
        var ltail = lhead
        var rhead: ListNode? = nil
        var rtail = rhead
        var p = head
        
        while p != nil {
            if p!.val < x {
                if lhead == nil {
                    lhead = p
                } else {
                    ltail!.next = p
                }
                ltail = p
            } else {
                if rhead == nil {
                    rhead = p
                } else {
                    rtail!.next = p
                }
                rtail = p
            }
            
            p = p!.next
        }
        
        ltail?.next = rhead
        rtail?.next = nil
        
        return lhead ?? rhead
    }
}