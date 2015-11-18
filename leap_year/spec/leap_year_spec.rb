require_relative '../leap_year'

RSpec.describe LeapYear do
  describe '#leap_year?' do
    subject { described_class.new }

    context 'when a year is not divisible by 4' do
      it 'returns false' do
        expect(subject.leap_year?(1993)).to be false
      end
    end

    context 'when a year is divisible by 4' do
      it 'returns true' do
        expect(subject.leap_year?(2004)).to be true
      end
    end
  end
end
