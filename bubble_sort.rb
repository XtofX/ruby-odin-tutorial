#!/usr/bin/env ruby
# frozen_string_literal: true

# Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort
# methodology (using #sort would be pretty pointless, wouldn’t it?).
#
# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

def swap_index(idx1, idx2, result)
  result[idx1], result[idx2] = result[idx2], result[idx1]
end

def bubble_sort(array)
  result = array.clone
  (1...(result.length)).each do |i|
    swap = false
    (1..(result.length - i)).each do |j| # take into account the end is already sorted
      next if result[j] > result[j - 1]

      swap_index(j-1, j, result)
      swap = true
    end
    break unless swap # OPTIMIZE: when nothing has been swapped => it is ordered
  end
  result
end

def verify(id, array, expected)
  result = bubble_sort(array)
  status = 'PASS'
  extra = ''
  if result != expected
    status = 'FAIL'
    extra = " , but found '#{result}'"
  end
  puts "Test #{id}: #{status} bubble_sort('#{array}') == '#{expected}'#{extra}"
end

t = 0
verify(t += 1, [1, 0], [0, 1])
verify(t += 1, [1, 0, 2], [0, 1, 2])
verify(t += 1, [2, 1, 0, 2], [0, 1, 2, 2])
verify(t += 1, [0, 6, 3, 2, 1, 0, 2], [0, 0, 1, 2, 2, 3, 6])
verify(t += 1, [1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6])
verify(t += 1, [1, 2, 6, 3, 4, 5], [1, 2, 3, 4, 5, 6])
verify(t += 1, [4, 3, 78, 2, 0, 2], [0, 2, 2, 3, 4, 78])

verify(t + 1, [0], [0])
