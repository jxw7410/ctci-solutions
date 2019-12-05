require_relative '../chapter2/node'

class Stack 
  def initialize(arg = [])
    @top = nil 
    arg.each {|val| self.push(val)}
  end 

  def push(val)
    new_node = Node.new(val)
    new_node.next = @top
    @top = new_node
    true
  end

  def pop
    return nil unless @top
    popped_val = @top.val 
    @top = @top.next 
    popped_val
  end

  def peek 
    return nil unless @top
    @top.val
  end
end

