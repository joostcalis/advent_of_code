require 'spec_helper'
require 'helpers/csv_fixture_loader'
require 'day_four/part_one/valid_passphrase'

describe 'Valid Passphrase' do
  let(:valid_passphrase)    { ['aaa', 'bbb', 'ccc', 'aa'] }
  let(:invalid_passphrase)  { ['aaa', 'bbb', 'ccc', 'aaa'] }

  context 'correctly identifies valid and invalid phrases' do

    before do
      expect(valid_passphrase?(input)).to eq expectation
    end

    context 'valid' do
      let(:input)       { valid_passphrase }
      let(:expectation) { true }

      it {}
    end

    context 'invalid' do
      let(:input)       { invalid_passphrase }
      let(:expectation) { false }

      it {}
    end

  end

  context 'correctly counts the amount of valid passphrases' do
    let(:passhphrase_array) { [valid_passphrase, invalid_passphrase] }
    let(:advent_input_array)    { load_csv_fixture('spec/fixtures/day_four/passphrases.csv') }

    before do
      expect(count_valid_passphrases(input)).to eq expectation
    end

    context 'with example array' do
      let(:input) { passhphrase_array }
      let(:expectation) { 1 }

      it {}
    end

    context 'with advent input' do
      let(:input) { advent_input_array }
      let(:expectation) { 386 }

      it {}
    end

  end

end
