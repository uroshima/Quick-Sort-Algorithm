require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array.first
    left = []
    right = []
    i = 1
    while i < array.length
      left.push(array[i]) if array[i] < pivot
      right.push(array[i]) if array[i] >= pivot
      i += 1
    end
    self.sort1(left) + [pivot] + self.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
     prc ||= Proc.new { |a,b| a <=> b }
     return array if length < 2
     pivot_idx = QuickSort.partition(array, start, length, &prc)
     left_len = pivot_idx - start
     right_len = length - (left_len + 1)
     QuickSort.sort2!(array, start, left_len, &prc)
     QuickSort.sort2!(array, pivot_idx + 1,right_len, &prc)
     return array
   end

   def self.partition(array, start, length, &prc)
     prc ||= Proc.new { |a,b| a <=> b }
     pivot_idx = start
     pivot = array[start]
     ((start+1)..(start + length -1)).each do |idx|
       # when new el is less than pivot el
       if prc.call(array[idx], pivot) < 0
           temp = array[pivot_idx+1]
           array[pivot_idx+1] = array[idx]
          array[idx] = temp
          pivot_idx += 1
       end
     end
     array[start], array[pivot_idx] = array[pivot_idx], array[start]
     pivot_idx
   end
  end
