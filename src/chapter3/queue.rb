class Queue
  def initialize(arg = [])
    @front = nil
    @last = nil
    arg.each { |val| self.enqueue(val) }
  end

  def enqueue(val)
    new_node = Node.new(val)
    if !@front
      @front = @last = new_node
    else
      @last.next = new_node
      @last = @last.next
    end
    true
  end

  def pop
    return nil unless @front
    popped_val = @front.val
    @front = @front.next
    popped_val
  end

  def peek
    return nil unless @front
    @front.val
  end
end
