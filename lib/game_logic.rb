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
    return player1 == @@choose_player ? player2 : player1
  end
end
