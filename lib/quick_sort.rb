class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array.first
    left = []
    right = []
    i = 0
    while i < array.length
      left.push(array[i]) if array[i] < pivot
      right.push(array[i]) if array[i] > pivot
      i += 1
    end
    self.sort1(left) + [pivot] + self.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
  end

  def self.partition(array, start, length, &prc)
  end
end
