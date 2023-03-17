# Heap / Priority Queue implementation in Ruby

## Example Usage

### Creating a min heap (by default)

```ruby
pq = Heap.new
```

### Creating a max heap of integers

```ruby
pq = Heap.new { |x, y|
  if x < y
    1
  elsif x > y then
    -1
  else
    0
  end
}
```

### Creating a min heap of arrays

Below implementation compares the arrays by their first elements but you can implement the relation however you desire.

```ruby
pq = Heap.new { |u, v|
  if u[0] < v[0]
    -1
  elsif u[0] > v[0] then
    1
  else
    0
  end
}
```

### Pushing elements to the heap

Pushes elements to the heap in `O(logn)` and maintains the heap structure.

```ruby
pq = Heap.new
pq.push(10) # { 10 }
pq << 10 # { 10, 10 }
pq << 5 # { 5, 10, 10 }
```

### Popping elements from the heap

Pops the highest priority element from the heap in `O(logn)` and maintains the heap structure.

```ruby
pq = Heap.new
pq << 10
pq << 20
pq << 30
puts pq.pop # 10
```

### Size of the heap, checking if the heap is empty, top of the heap, and clearing the heap

All operations are done in `O(1)`.

```ruby
pq = Heap.new
pq << 20
pq << 30
puts pq.size # 2
puts pq.empty # false
puts pq.top # 20
pq.clear # {}
```