require 'spec_helper'
require 'to_words'

describe ToWords do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end
end

def hundreds_ordinal_string(hundreds_ordinal, hundreds_integer) 
  hundreds_integer.zero? ? "" : "#{hundreds_ordinal} hundred "
end

def tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)
  if tens_integer < 2 && ones_integer.zero?
    "#{tens_ordinal}"
  elsif tens_integer < 2 
    ""
  elsif ones_integer.zero?
    "#{tens_ordinal}"
  else
    "#{tens_ordinal} "
  end
end

def integer_builder(hundreds_integer, tens_integer, ones_integer)
  "#{hundreds_integer unless hundreds_integer.zero?}#{tens_integer unless tens_integer.zero? && hundreds_integer.zero?}#{ones_integer}"
end

describe ToWords::Ordinal do
  describe '#hundreds_digit' do
    context 'when given a 3 digit number' do
      it 'returns the hundreds place digit' do
        expect(described_class.new(347).hundreds_digit).to eq(3)
      end
    end

    context 'when given a 4 digit number' do
      it 'returns the hundreds place digit' do
        expect(described_class.new(1347).hundreds_digit).to eq(3)
      end
    end

    context 'when given a 5 digit number' do
      it 'returns the hundreds place digit' do
        expect(described_class.new(21347).hundreds_digit).to eq(3)
      end
    end
  end

  describe "#tens_digit" do
    context 'when given a 3 digit number' do
      it 'returns the tens place digit' do
        aggregate_failures "tens place digits I cannot convert" do
          expect(described_class.new(213).tens_digit).to eq(1)
          expect(described_class.new(747).tens_digit).to eq(4)
        end
      end
    end
  end

  describe "#ones_digit" do
    context 'when given a 3 digit number' do
      it 'returns the ones place digit' do
        expect(described_class.new(678).ones_digit).to eq(8)
      end
    end
  end



  describe "#ordinalize_two_digit_value" do
    context 'when given a one digit value' do
      it 'returns the ordinalized value' do
        expect(described_class.new(1).ordinalize_two_digit_value(0)).to eq('zero')
        expect(described_class.new(100).ordinalize_two_digit_value(0)).to eq('zero')

        expect(described_class.new(1).ordinalize_two_digit_value(1)).to eq('one')
        expect(described_class.new(1).ordinalize_two_digit_value(2)).to eq('two')
      end
    end
  end

  context "#from_integer" do
    context "types" do
      it 'constructs a new ordinal' do
        ordinal = Ordinal.from_integer(1)
        expect(ordinal).to be_a Ordinal
      end
    end

    context "handling specific values" do
      subject { Ordinal.from_integer(value) }

      SINGLE_DIGIT_CONVERSIONS = [ 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' ]

      TEEN_CONVERSIONS = [ 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen' ]

      TENS_PLACE_CONVERSION = ['zero', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety' ]

      SINGLE_DIGIT_CONVERSIONS.each_with_index do |hundreds_ordinal , hundreds_integer|
        if hundreds_integer > 0
          describe "should convert #{hundreds_integer}00 => #{hundreds_ordinal} hundred" do
            let(:value) { hundreds_integer * 100 }
            its(:to_str) { is_expected.to eql ("#{hundreds_ordinal} hundred") }
          end
        end

        TENS_PLACE_CONVERSION.each_with_index do |tens_ordinal, tens_integer|
          if tens_integer == 0
            SINGLE_DIGIT_CONVERSIONS.each_with_index do |ones_ordinal, ones_integer|
              unless ones_integer.zero?
                describe "should convert #{integer_builder(hundreds_integer,tens_integer,ones_integer)} => #{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}#{ones_ordinal}" do
                  let(:value) { (hundreds_integer*100) + (tens_integer*10) + ones_integer }
                  its(:to_str) { is_expected.to eql("#{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}#{ones_ordinal}")}
                end
              end
            end

          elsif tens_integer == 1
            TEEN_CONVERSIONS.each_with_index do |ones_ordinal, ones_integer|
              if ones_integer.zero?
                describe "should convert #{integer_builder(hundreds_integer,tens_integer,ones_integer)} => #{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}" do
                  let(:value) { (hundreds_integer*100) + (tens_integer*10) + ones_integer }
                  its(:to_str) {is_expected.to eql("#{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}")}
                end
              else
                describe "should convert #{integer_builder(hundreds_integer,tens_integer,ones_integer)} => #{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}#{ones_ordinal}" do
                  let(:value) { (hundreds_integer*100) + (tens_integer*10) + ones_integer }
                  its(:to_str) { is_expected.to eql("#{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}#{ones_ordinal}")}
                end
              end
            end

          else 
            SINGLE_DIGIT_CONVERSIONS.each_with_index do |ones_ordinal, ones_integer|
              if ones_integer.zero?
                describe "should convert #{integer_builder(hundreds_integer,tens_integer,ones_integer)} => #{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}" do
                  let(:value) { (hundreds_integer*100) + (tens_integer*10) + ones_integer }
                  its(:to_str) {is_expected.to eql("#{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}")}
                end
              else
                describe "should convert #{integer_builder(hundreds_integer,tens_integer,ones_integer)} => #{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}#{ones_ordinal}" do
                  let(:value) { (hundreds_integer*100) + (tens_integer*10) + ones_integer }
                  its(:to_str) {is_expected.to eql("#{hundreds_ordinal_string(hundreds_ordinal, hundreds_integer)}#{tens_ordinal_string(tens_ordinal, tens_integer, ones_integer)}#{ones_ordinal}")}
                end
              end
            end
          end
        end
      end
    end
  end
end

# endz justify meanz
