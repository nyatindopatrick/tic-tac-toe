class Play
  def initialize(current_player)
    @current_player = current_player
  end

  def player_sign(param1)
    @current_player == param1 ? 'X' : 'O'
  end
end
