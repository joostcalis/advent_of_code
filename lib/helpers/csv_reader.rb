require 'csv'

def array_from_csv(file_path, options = {})
  CSV.read(file_path, options)
end
