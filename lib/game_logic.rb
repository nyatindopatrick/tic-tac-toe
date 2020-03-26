# Display Board
require_relative './helper_module.rb'
class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
    <<-GAME
    \t -------------
    \t | #{@board[0]} | #{@board[1]} | #{@board[2]} |
    \t -------------
    \t | #{@board[3]} | #{@board[4]} | #{@board[5]} |
    \t -------------
    \t | #{@board[6]} | #{@board[7]} | #{@board[8]} |
    \t -------------
    GAME
  end

  # Checking and eturning the winner
  def win_moves(player)
    temp = []
    @board.each_with_index do |val, i|
      player == @player1 ? (temp << i if val == 'X') : (temp << i if val == 'O')
    end
    temp
  end

  def check_winner(player, param2)
    winning_cases = [[0, 1, 2], [0, 4, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
                     [2, 4, 6], [3, 4, 5], [6, 7, 8]]
    player_win = nil
    if param2.length <= 3
      player_win = "#{player} wins" if winning_cases.include? param2
    else
      winning_cases.each do |j|
        player_win = "#{player} wins" if (param2 + j).uniq.length == 4
      end
    end
    player_win
  end

  def empty_space(param2)
    input_message = Helper.prompt_users(param2)
    if @board[input_message - 1] == ' '
      input_message
    else
      empty_space(param2)
    end
  end

  def update_board(param1, param2)
    @board[param1 - 1] = param2
  end
end
