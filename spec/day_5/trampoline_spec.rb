require 'spec_helper'
require 'helpers/csv_fixture_loader'
require 'day_5/part_1/trampoline.rb'

describe 'Trampoline Jumper' do
  let(:example_trampoline) { [0, 3, 0, 1, -3] }
  let(:advent_input_trampoline) do
    load_csv_fixture('spec/fixtures/day_5/trampoline.csv').flatten.compact.map(&:to_i)
  end

  before do
    trampoline_jumper = TrampolineJumper.new(input)
    expect(trampoline_jumper.jump_till_exit).to eq expectation
  end

  context 'with simple example input gets the right output' do
    let(:input)       { example_trampoline }
    let(:expectation) { 5 }

    it {}
  end

  context 'with actual advent input gets the right output' do
    let(:input)       { advent_input_trampoline }
    let(:expectation) { 388611 }

    it {}
  end
end
