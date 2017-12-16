def get_sum(sequence)
  array = convert_sequence_to_array(sequence)
  array.each_with_index.reduce(0) do |sum, (item, index)|
    sum += item if item == array[index - 1]
    sum
  end
end

def convert_sequence_to_array(sequence)
  sequence.to_s.split('').map(&:to_i)
end
