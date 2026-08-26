require_relative '../main'

describe Board do
  before do
    @board_one = Board.new
    @board_two = Board.new
    @board_two.make_move(2, 0)
  end

  describe 'incorrect coordinates' do
    it 'returns false for incorrect i' do
      expect(@board_one.make_move(5, 2)).to eq(false)
    end
    it 'returns false for incorrect j' do
      expect(@board_one.make_move(2, 5)).to eq(false)
    end
    it 'returns true for correct i and j' do
      expect(@board_one.make_move(0, 1)).to eq(true)
    end
  end

  describe 'moving in occupied square' do
    it 'returns false for trying to move in occupied square' do
      expect(@board_two.make_move(2, 0)).to eq(false)
    end
  end
end
