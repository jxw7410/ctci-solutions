require_relative "node"

class LinkedList
  def initialize(arg = [])
    @head = Node.new(nil)
    @tail = Node.new(nil)

    @head.next = @tail
    @tail.next = @head # points backwards

    self.insert(*arg)
  end

  def display
    raise 'Linked List is empty.' if @head.next == @tail 
    t_node = @head.next
    print "#{t_node.val}"
    until t_node == @tail.next
      print " --> "
      t_node = t_node.next 
      print "#{t_node.val}"
    end 
    puts
  end
  

  def find(val)
    current_node = @head.next 
    until current_node == @tail 
      return val if current_node.val == val
      current_node = current_node.next
    end
  end

  def remove(val)
    raise "Linked List is empty." unless @head.next

    current_node = @head.next 
    prev_node = @head
    until current_node == @tail 
        if current_node.val == val 
          prev_node.next = current_node.next
          current_node.next = nil
          @tail.next = prev_node if @tail.next == current_node
          return true
        end
        current_node = current_node.next 
        prev_node = prev_node.next
    end
    false 
  end

  def insert(*vals)
    vals.each {| val| _insert(val)}
    true
  end

  private

  def _insert(val)
    new_node = Node.new(val)
    if @head.next == @tail
      @head.next = new_node
    else
      last_node = @tail.next
      last_node.next = new_node
    end
    new_node.next = @tail
    @tail.next = new_node
  end
end

# sample test
linked_list = LinkedList.new([1,2,3,4,5])
linked_list.display
linked_list.remove(3)
linked_list.display
linked_list.insert(10)
linked_list.display
p linked_list.find(3)
p linked_list.find(4)
