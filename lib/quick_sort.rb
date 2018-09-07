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
    debugger
    return array if length <= 1
    prc ||= Proc.new { |a, b| a <=> b }
    pivot = array[0]
    i = 1
    start = 1
    while i < length
      if prc.call(array[i], pivot) == -1
        if array[start...i].empty? == false || array[start...i].first != array[i]
          array[i], array[start] = array[start], array[i]
        end
        start += 1
      end
      i += 1
    end
    array[0], array[start - 1] = array[start - 1], array[0]
    p array
    QuickSort.sort2!(array[0...start - 1], start = 0, length = array[0...start - 1].length, &prc) + [pivot] + QuickSort.sort2!(array[start...length], start, length = array[start...length].length, &prc)
  end

  def self.partition(array, start, length, &prc)

  end
end
