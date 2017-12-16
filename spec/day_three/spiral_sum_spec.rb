require 'spec_helper'
require 'day_three/part_two/sum_spiral'

describe 'Spiral' do
  let(:examples) do
    {
      1 => 2,
      2 => 4,
      5 => 10,
      10 => 11,
      289326 => 295229
    }
  end

  it 'finds the right amount of steps back to origin' do
    examples.each do |input, expectation|
      sum_spiral_builder = SumSpiralBuilder.new(input)
      expect(sum_spiral_builder.get_first_value_above_treshold).to eq expectation
    end
  end

end
