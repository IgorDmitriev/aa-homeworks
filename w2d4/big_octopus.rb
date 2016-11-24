fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p 'max_by'
p fishes.max_by(&:length)

def on2(arr)
  arr.each_with_index do |el1, idx1|
    max_length = true
    arr.each_with_index do |el2, idx2|
      next if idx1 == idx2
      max_length = false if el1.length < el2.length
    end

    return el1 if max_length
  end
end

p 'O(n^2):'
p on2(fishes)

def merge_sort(arr, &prc)
  return [] if arr.empty?
  return arr if arr.size == 1

  mid_idx = arr.size / 2
  left = arr[0...mid_idx]
  right = arr[mid_idx..-1]
  merge(merge_sort(left, &prc), merge_sort(right, &prc), &prc)
end

def merge(left, right, &prc)
  prc ||= Proc.new { |a, b| a <=> b }
  left_idx = left.size
  right_idx = right.size
  merged = []
  while left_idx > 0 && right_idx > 0
    case prc.call(left.first, right.first)
    when -1
      merged << left.shift
      left_idx -= 1
    else
      merged << right.shift
      right_idx -= 1
    end
  end
  merged + left + right
end

def nlogn(arr)
  arr = merge_sort(arr) { |a, b| a.length <=> b.length }
  arr.last
end
p 'O(n*log n)'
p nlogn(fishes)

def on(arr)
  max_el = ""
  arr.each do |el|
    max_el = el if el.length > max_el.length
  end
  max_el
end

p 'O(n)'
p on(fishes)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, arr)
  arr.each_with_index do |el, idx|
    return idx if el == dir
  end
  false
end
p 'Slow dance:'
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end
p 'Hash dance:'
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
