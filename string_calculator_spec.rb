require 'rails_helper'

RSpec.describe StringCalculator do
  describe '.string_calc' do
    context 'when input is an empty string' do
      it 'returns 0' do
        expect(StringCalculator.string_calc("")).to eq(0)
      end
    end

    context 'when input contains numbers' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.string_calc("1,2,3")).to eq(6)
        expect(StringCalculator.string_calc("5;10\n15")).to eq(30)
        expect(StringCalculator.string_calc("42")).to eq(42)
      end
    end

    context 'when input contains negative numbers' do
      it 'raises NegativeIntegerError and returns 0' do
        expect { StringCalculator.string_calc("1,2,-3") }.to output("Negative numbers not allowed: -3\n").to_stdout
        expect(StringCalculator.string_calc("1,-2,3")).to eq(0)
      end
    end

    context 'when input contains invalid data type' do
      it 'outputs an error message' do
        expect { StringCalculator.string_calc(123) }.to output("Input should be a string of comma-separated numbers\n").to_stdout
      end
    end

    context 'when input has no delimiters' do
      it 'returns the integer value' do
        expect(StringCalculator.string_calc("10")).to eq(10)
      end
    end

    context 'when input has multiple delimiters' do
      it 'correctly sums numbers with different delimiters' do
        expect(StringCalculator.string_calc("1\n2;3")).to eq(6)
        expect(StringCalculator.string_calc("1, 2; 3\n4")).to eq(10)
      end
    end
  end
end
