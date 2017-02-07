/**
 * Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 *
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		var li1 = l1
		var li2 = l2
		let res = ListNode(0)
		var p = res
		while li1 != nil && li2 != nil {
			if li1!.val < li2!.val {
				p.next = li1
				p = p.next!
				li1 = li1!.next
			} else {
				p.next = li2
				p = p.next!
				li2 = li2!.next
			}
		}

		while li1 != nil {
			p.next = li1
			p = p.next!
			li1 = li1!.next
		}

		while li2 != nil {
			p.next = li2
			p = p.next!
			li2 = li2!.next
		}

		return res.next
    }
}