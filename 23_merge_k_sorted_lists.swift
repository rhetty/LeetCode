/*
Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
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
    func merge(_ h1: ListNode?, _ h2: ListNode?) -> ListNode? {
        if h1 == nil { return h2 }
        if h2 == nil { return h1 }
        
        let h = ListNode(0)
        var p1 = h1
        var p2 = h2
        var tail = h
        
        while (p1 != nil && p2 != nil) {
            if (p1!.val < p2!.val) {
                tail.next = p1
                p1 = p1!.next
            } else {
                tail.next = p2
                p2 = p2!.next
            }
            tail = tail.next!
        }
        
        if (p1 != nil) {
            tail.next = p1
        }
        
        if (p2 != nil) {
            tail.next = p2
        }
        
        
        return h.next
    }
    
    func mergeLists(_ lists: [ListNode?], _ l: Int, _ r: Int) -> ListNode? {
        if l > r { return nil }
        if l == r { return lists[l] }
        
        let m = (l + r) / 2
        
        return merge(mergeLists(lists, l, m), mergeLists(lists, m + 1, r))
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return mergeLists(lists, 0, lists.count - 1)
    }
}