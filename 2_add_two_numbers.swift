/**
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		var m1 = l1
		var m2 = l2
		var ret = ListNode(0)
		var p = ret
		var jin = 0
		var sum = 0

		while m1 != nil && m2 != nil {
			sum = m1!.val + m2!.val + jin
			jin = sum / 10
			if sum > 9 {
				sum = sum % 10
			}
			p.next = ListNode(sum)
			p = p.next!
			m1 = m1!.next
			m2 = m2!.next
		}
		while m1 != nil {
			sum = m1!.val + jin
			jin = sum / 10
			if sum > 9 {
				sum = sum % 10
			}
			p.next = ListNode(sum)
			p = p.next!
			m1 = m1!.next
		}
		while m2 != nil {
			sum = m2!.val + jin
			jin = sum / 10
			if sum > 9 {
				sum = sum % 10
			}
			p.next = ListNode(sum)
			p = p.next!
			m2 = m2!.next
		}
		if jin > 0 {
			p.next = ListNode(jin)
		}
		return ret.next
    }
}