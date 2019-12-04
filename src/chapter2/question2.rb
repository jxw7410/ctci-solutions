require_relative "node"


def get_kth_from_last_element(node, k)
  ptr1 = node
  ptr2 = node
  # create a kth gap between ptr1 and ptr2 
  while ptr2 && k >= 0
    ptr2 = ptr2.next 
    k -= 1    
  end

  raise 'k is larger than length of linked list' unless k < 0

  while ptr2 
    ptr1 = ptr1.next 
    ptr2 = ptr2.next
  end

  ptr1.val
end




node = generate_linked_list_from_arr([1,2,3,4,5])
p get_kth_from_last_element(node, 4)