require 'spec_helper'
require 'day_two/checksum_part_one'

describe 'Checksum part One' do
  let(:fixture_path)    { 'spec/fixtures/day_two' }
  let(:simple_example)  { fixture_path + '/simple_example.csv' }
  let(:advent_input)    { fixture_path + '/advent_input.csv' }

  before do
    expect(get_checksum(file_path)).to eq output_number
  end

  context 'simple example' do
    let(:file_path) { simple_example }
    let(:output_number) { 18 }

    it {}
  end

  context 'advent input' do
    let(:file_path) { advent_input }
    let(:output_number) { 45158 }

    it {}
  end
end
