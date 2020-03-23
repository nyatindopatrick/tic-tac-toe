class Board
  # attr_reader :place

  # def initialize(place)
  #     @place = place
  # end
  def display_board(place)
    puts "\t -------------"
    puts "\t | #{place[0]} | #{place[1]} | #{place[2]} |"
    puts "\t -------------"
    puts "\t | #{place[3]} | #{place[4]} | #{place[5]} |"
    puts "\t -------------"
    puts "\t | #{place[6]} | #{place[7]} | #{place[8]} |"
    puts "\t -------------"
  end
end

class Logic
  @@choose_player = nil
  @@count = 1

  def players_turn(player1, player2)
    @@choose_player = rand(0..1)
    @@choose_player = (@@choose_player == 0 ? player1 : player2)
    @@choose_player
  end

  def change_player(player1, player2)
    next_player_move = player1 == @@choose_player ? player2 : player1
    $playerX = next_player_move
    $playerO = !next_player_move
    return next_player_move
  end

  # def check_empty(param1, param2)
  #   game_symbol = nil
  #   if param1 == " " 
  #     game_symbol = param2
  #   elsif param1 != " "
  #     game_symbol =  "No free space! Choose another position."
  #   end
  #   game_symbol
  # end
end

class Winner
  def win_moves(cases)
    player1_array = []
    player2_array = []
    winning_cases = [ [0,1,2], [0,4,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6],[3,4,5], [6,7,8] ]
    player_win = nil

    cases.each_with_index do |index,value|
      if index == "X"
        player1_array << value
      elsif index == "O"
        player2_array << value
      end
    end

    winning_cases.each do |i|
      if player1_array == i
        player_win = "#{$playerX} wins"
        break
      elsif player2_array == i
        player_win = "#{$playerO} Wins"
        break
      else
        nil
      end
    end
      player_win
  end
end
