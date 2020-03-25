# rubocop:disable Style/GlobalVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
# Display Board
class Board
  $place = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def display_board
    <<-GAME
    \t -------------
    \t | #{$place[0]} | #{$place[1]} | #{$place[2]} |
    \t -------------
    \t | #{$place[3]} | #{$place[4]} | #{$place[5]} |
    \t -------------
    \t | #{$place[6]} | #{$place[7]} | #{$place[8]} |
    \t -------------
    GAME
  end

  def win_moves(player)
    temp = []
    winning_cases = [[0, 1, 2], [0, 4, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
                     [2, 4, 6], [3, 4, 5], [6, 7, 8]]
    player_win = nil
    $place.each_with_index do |val, i|
      player == @player1 ? (temp << i if val == 'X') : (temp << i if val == 'O')
    end
    if temp.length <= 3
      player_win = "#{player} wins" if winning_cases.include? temp
    else
      winning_cases.each do |j|
        player_win = "#{player} wins" if (temp + j).uniq.length == 4
      end
    end
    player_win
  end
end

# Game logic
class Logic
  # updates the board with the new user input
  def update_board(param1, param2)
    res = nil
    if $place[param1 - 1] == ' '
      $place[param1 - 1] = param2
    else
      res = 'Spot unavailable. Please choose another spot.'
    end
    res
  end
end

# Determining the winner

# rubocop:enable Style/GlobalVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
