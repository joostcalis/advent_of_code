require 'spec_helper'
require 'day_6/part_2/memory_bank_2'

describe 'Memory Optimizer 2.0' do
  let(:examples) do
    [
      {
        input: [0, 2, 7, 0],
        expectation: 4
      },
      {
        input: [10, 3, 15, 10, 5, 15, 5, 15, 9, 2, 5, 8, 5, 2, 3, 6],
        expectation: 2765
      }
    ]
  end

  it 'correctly finds the sequence with the first memory duplication' do
    examples.each do |example|
      memory_optimizer = MemoryBankOptimizerTwo.new(example[:input])
      expect(memory_optimizer.redistribute_blocks_till_mem_bank_duplication).to eq example[:expectation]
    end
  end
end
