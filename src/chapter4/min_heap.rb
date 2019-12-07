require "byebug"

class MinHeap
  def initialize()
    @heap = []
  end

  def print
    p @heap
  end

  # O(1)
  def top
    @heap[0]
  end

  # O( log n)
  def insert(val)
    @heap << val
    bubble_down(@heap.length - 1)
    true
  end

  # O( log n)
  def pop()
    return false if @heap.empty?
    _swap(0, -1)
    val = @heap.pop
    bubble_up
    val
  end

  private

  def bubble_down(current_index)
    unless current_index == 0
      parent_index = (current_index - 1) / 2
      if @heap[current_index] < @heap[parent_index]
        _swap(parent_index, current_index)
        bubble_down(parent_index)
      end
    end
  end

  def bubble_up(current_index = 0)
    current_val = @heap[current_index]
    left_child_index = 2 * current_index + 1
    right_child_index = 2 * current_index + 2
    left_child = @heap[left_child_index]
    right_child = @heap[right_child_index]

    if left_child && right_child && left_child < current_val && right_child < current_val
      left_child < right_child ? _bubble_up(current_index, left_child_index) : _bubble_up(current_index, right_child_index)
    elsif left_child && left_child < current_val
      _bubble_up(current_index, left_child_index)
    elsif right_child && right_child < current_val
      _bubble_up(current_index, right_child_index)
    end
  end

  def _swap(parent_index, child_index)
    @heap[parent_index], @heap[child_index] = @heap[child_index], @heap[parent_index]
  end

  def _bubble_up(parent_index, child_index)
    _swap(parent_index, child_index)
    bubble_up(child_index)
  end
end

min_heap = MinHeap.new

[3, 1, 4, 3, 4, 5, 6, 7, 2].each { |val| min_heap.insert(val) }

min_heap.print

val = 0
while val
  val = min_heap.pop
  p val
  min_heap.print
end
