/*
Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

You may not alter the values in the nodes, only nodes itself may be changed.

Only constant memory is allowed.

For example,
Given this linked list: 1->2->3->4->5

For k = 2, you should return: 2->1->4->3->5

For k = 3, you should return: 3->2->1->4->5
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 1 { return head }
        
        var p = head
        var i = 0
        
        while p != nil {
            i += 1
            if i == k {
                var pre = head
                p = pre!.next
                var post = p!.next
                
                for i in 1 ..< k {
                    p!.next = pre
                    pre = p
                    p = post
                    post = p?.next
                }
                
                head!.next = reverseKGroup(p, k)
                return pre
            }
            p = p!.next
        }
        
        return head
    }
}