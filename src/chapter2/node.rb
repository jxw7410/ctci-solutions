class Node
  attr_accessor :val, :next
  def initialize(val)
    @val = val;
    @next = nil;
  end
end


def generate_linked_list_from_arr(arr)
  raise 'Cannot use an empty array' if arr.empty?
  head = Node.new(arr[0])
  t_head = head 
  for idx in 1...arr.length do 
    t_node = Node.new(arr[idx])
    t_head.next = t_node;
    t_head = t_head.next
  end

  head 
end