require 'rspec'
require_relative '../lib/game_logic.rb'

RSpec.describe Board do
  let(:board) { Board.new('player1', 'player2') }
  describe '#display_board' do
    it 'displays game board' do
      expect(board.display_board.class).to eq String
    end
  end

  describe '#win_moves' do
    it 'returns current player moves' do
      expect(board.win_moves('player1').class).to eq Array
    end
    it 'returns current player moves' do
      expect(board.win_moves('player2').class).to eq Array
    end
  end

  describe '#check_winner' do
    it 'checks possible winning combination' do
      expect(board.check_winner('player1', [3, 4, 5])).to eq 'player1 wins'
    end
    it 'checks possible winning combination' do
      expect(board.check_winner('player2', [0, 4, 8])).to eq 'player2 wins'
    end
    it 'return nil if no winning combination' do
      expect(board.check_winner('player2', [1, 2, 3])).to eq nil
    end
  end

  describe '#check_blank' do
    it 'checks from available space' do
      expect(board.check_blank(1)).to eq true
    end
  end

  describe '#update_board' do
    it 'update the board with X' do
      expect(board.update_board(1, 'X')).to eq 'X'
    end
    it 'update the board with O' do
      expect(board.update_board(1, 'O')).to eq 'O'
    end
  end
end
