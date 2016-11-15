=begin

You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

    Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

=end

#Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  r = ListNode.new(0);
  i = r;
  t = 0
  while(l1 != nil or l2 != nil)
    i.next = ListNode.new(0) unless i.next
    i = i.next
    if l1
      t += l1.val
      l1 = l1.next
    end
    if l2
      t += l2.val
      l2 = l2.next
    end
    i.val = t % 10
    t = i.val / 10
  end
  r.next
end