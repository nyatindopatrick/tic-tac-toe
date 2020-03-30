require 'rspec'
require_relative '../lib/game_play.rb'

RSpec.describe Play do
  let(:play) { Play.new('player1') }
  describe '#player_sign' do
    it 'should return X for player1' do
      expect(play.player_sign('player1')).to eq 'X'
    end
    it 'should return O for player2' do
      expect(play.player_sign('player2')).to eq 'O'
    end
  end
end
