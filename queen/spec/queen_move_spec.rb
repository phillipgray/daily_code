require_relative '../queen_move'

RSpec.describe Array do
  describe '::queen_move_valid?' do
    it 'is false if the coord are not horizontally, vertically or diagonally aligned' do
      expect([1, 1].queen_move_valid?([2, 3])).to be false
    end

    it 'is true if the coord are horizontally aligned' do
      expect([1, 1].queen_move_valid?([3, 1])).to be true
    end

    it 'is true if the coord are diagonally aligned' do
      expect([1, 1].queen_move_valid?([3, 3])).to be true
    end

    it 'is true if the coord are vertically aligned' do
      expect([1, 1].queen_move_valid?([1, 3])).to be true
    end
  end
end
