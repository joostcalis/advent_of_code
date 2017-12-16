require_relative '../helpers/csv_reader'

def get_checksum(file_path)
  array = array_from_csv(file_path)

  array.each.reduce(0) do |sum, item_array|
    item_array.map!(&:to_i)
    sum += item_array.max - item_array.min
  end
end
