require 'spec_helper'
require 'day_three/part_one/spiral'

describe 'Spiral' do
  let(:examples) do
    {
      12 => 3,
      23 => 2,
      1024 => 31,
      289326 => 419
    }
  end

  it 'finds the right amount of steps back to origin' do
    examples.each do |input, expectation|
      spiral_builder = SpiralBuilder.new(input)
      expect(spiral_builder.calc_steps_back_to_origin).to eq expectation
    end
  end
  
end
