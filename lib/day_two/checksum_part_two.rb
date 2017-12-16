require_relative '../helpers/csv_reader'

def get_evenly_divisible_sum(file_path)
  array = array_from_csv(file_path)

  array.each.reduce(0) do |sum, item_array|
    item_array.map!(&:to_i)
    match1, match2 = item_array.sort
                       .combination(2)
                       .find{ |duo| duo[1] % duo[0] == 0 }
    sum += (match2 / match1)
  end
end
