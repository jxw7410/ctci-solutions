require_relative 'node'
require 'set'

def remove_dups_from_linked_list(node)
  seen = Set.new([node.val])
  ptr1 = node
  ptr2 = node.next

  while ptr2
    unless seen.include?(ptr2.val)
      ptr1.next = ptr2
      ptr1 = ptr2 
    end
    seen.add(ptr2.val)
    ptr2 = ptr2.next
    ptr1.next = nil
  end
  
  node
end

node = generate_linked_list_from_arr([1,2,3,1,3,2,5,3,4,3])
p remove_dups_from_linked_list(node)