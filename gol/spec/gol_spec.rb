$LOAD_PATH.unshift(File.expand_path('../..', __FILE__))
require 'pry'
require 'gol'

describe Game do
  let(:blinker1) { [
    [0,0,0],
    [1,1,1],
    [0,0,0],
  ] }

  let(:blinker2) { [
    [0,1,0],
    [0,1,0],
    [0,1,0],
  ] }

  let(:block_to_s) {
<<-END
0 0 0 0
0 x x 0
0 x x 0
0 0 0 0
END
}

  let(:blinker1_to_s) { <<-END
0 0 0
x x x
0 0 0
END
  }

  let(:blinker2_to_s) { <<-END
0 x 0
0 x 0
0 x 0
END
  }

  let(:block) { [
    [0,0,0,0],
    [0,1,1,0],
    [0,1,1,0],
    [0,0,0,0],
  ] }
  let(:board) { block }

  subject(:game) { Game.new(board) }

  it 'can be initialized with a board' do
    expect(subject).to be_a(Game)
  end

  describe '#to_s' do
    let(:display_board) { block_to_s }

    subject(:board_to_s) { game.to_s }

    it 'prints out the current board' do
      expect(subject).to eq(display_board)
    end

    context 'a non-square board' do
      let(:board) { [
        [0,1,1,0],
        [0,1,1,0],
      ] }
      let(:display_board) { <<-END
0 x x 0
0 x x 0
END
      }

      it 'prints out the current board' do
        expect(subject).to eq(display_board)
      end
    end
  end

  describe '#next' do
    let(:board) { [
      [0,0,0,0],
      [0,1,1,0],
      [0,1,1,0],
      [0,0,0,0],
    ] }
    subject(:next_game) { game.next }

    it { is_expected.to be_a Game }

    it 'returns a different game for the next generation' do
      expect(subject).to_not be_equal(game) 
    end

    context 'when board is blinker1' do
      let(:board) { blinker1 }
      subject(:next_game_to_s) { next_game.to_s }

      it { is_expected.to eq(blinker2_to_s) }
    end
  end
end
