class Heap

  def initialize(&block)
    @comparator = block || Proc.new { |x, y| x <=> y } # min heap by default
    @heap = []
  end

  def size
    @heap.size
  end

  def top
    @heap[0]
  end

  def push(new_item)
    @heap << new_item
    sift_down(0, @heap.size - 1)
  end
  alias_method :<<, :push

  def pop
    last = @heap.pop
    unless self.empty
      ret = @heap[0]
      @heap[0] = last
      sift_up(0)
      return ret
    end
    last
  end

  def empty
    @heap.empty?
  end

  def clear
    @heap = []
  end

private

  def sift_up(pos)
    new_item = @heap[pos]
    end_pos = @heap.size
    start_pos = pos
    child_pos = left(pos)
    while child_pos < end_pos
      right_pos = right(pos)
      if right_pos < end_pos && @comparator[@heap[child_pos], @heap[right_pos]] == 1
        child_pos = right_pos
      end
      @heap[pos] = @heap[child_pos]
      pos = child_pos
      child_pos = left(pos)
    end
    @heap[pos] = new_item
    sift_down(start_pos, pos)
  end

  def sift_down(start, pos)
    new_item = @heap[pos]

    while start < pos
      parent_pos = parent(pos)
      parent = @heap[parent_pos]

      if @comparator[new_item, parent] == -1
        @heap[pos] = parent
        pos = parent_pos
        next
      end
      break
    end
    @heap[pos] = new_item
  end

  def left(pos)
    2*pos+1
  end

  def right(pos)
    2*pos+2
  end

  def parent(pos)
    (pos - 1) / 2
  end
end
