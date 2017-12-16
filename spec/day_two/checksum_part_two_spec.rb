require 'spec_helper'
require 'day_two/checksum_part_two'

describe 'Checksum part Two' do
  let(:fixture_path)    { 'spec/fixtures/day_two' }
  let(:simple_example)  { fixture_path + '/simple_example_2.csv' }
  let(:advent_input)    { fixture_path + '/advent_input.csv' }

  before do
    expect(get_evenly_divisible_sum(file_path)).to eq output_number
  end

  context 'simple example' do
    let(:file_path) { simple_example }
    let(:output_number) { 9 }

    it {}
  end

  context 'advent input' do
    let(:file_path) { advent_input }
    let(:output_number) { 294 }

    it {}
  end
end
