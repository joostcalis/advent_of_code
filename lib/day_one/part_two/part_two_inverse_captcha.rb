def get_sum_2(sequence)
  array = convert_sequence_to_array_2(sequence)
  array.each_with_index.reduce(0) do |sum, (item, index)|
    sum += item if has_halfwayround_match?(array, index)
    sum
  end
end

def convert_sequence_to_array_2(sequence)
  sequence.to_s.split('').map(&:to_i)
end

def has_halfwayround_match?(array, index)
  max = array.length
  offset = max / 2
  index_to_check = index + offset
  index_to_check -= max if index_to_check >= max
  array[index] == array[index_to_check]
end
