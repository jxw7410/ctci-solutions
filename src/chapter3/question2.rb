# design a stack with push, pop, and min, all needs to be O(1)
require_relative '../chapter2/node'
class Stack
  attr_reader :min

  def initialize(arg = [])
    @top = nil
    @min = 1.0/0.0 #Infinity
    arg.each { |val| self.push(val) }
  end

  # O(1)
  def push(val)
    new_node = Node.new(val)
    new_node.next = @top
    @top = new_node
    @min = new_node.val if @min > new_node.val
    true
  end

  # O(1)
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


stack = Stack.new([3,4,2,6])

p stack.min
