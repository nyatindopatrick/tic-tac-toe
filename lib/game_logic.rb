# rubocop:disable Style/GlobalVars, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
# Display Board
class Board
  $place = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

  def display_board
    puts "\t -------------"
    puts "\t | #{$place[0]} | #{$place[1]} | #{$place[2]} |"
    puts "\t -------------"
    puts "\t | #{$place[3]} | #{$place[4]} | #{$place[5]} |"
    puts "\t -------------"
    puts "\t | #{$place[6]} | #{$place[7]} | #{$place[8]} |"
    puts "\t -------------"
  end
end

# Game logic
class Logic
  # Prompt user to enter value
  def askuser(param)
    user_prompt = "#{param} - Please enter a value between 1-9"
    puts user_prompt
    player1_choice = gets.chomp.to_i
    player1_choice
  end

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
class Winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def win_moves
    player1_array = []
    player2_array = []
    winning_cases = [[0, 1, 2], [0, 4, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
                     [2, 4, 6], [3, 4, 5], [6, 7, 8]]
    player_win = nil

    $place.each_with_index do |index, value|
      if index == 'X'
        player1_array << value
      elsif index == 'O'
        player2_array << value
      end
    end
    if (player1_array.length <= 3) || (player2_array.length <= 3)
      player_win = "#{@player1} wins" if winning_cases.include? player1_array
      player_win = "#{@player2} Wins" if winning_cases.include? player2_array
    else
      winning_cases.each do |i|
        player_win = "#{@player1} wins" if (player1_array + i).uniq.length == 4
        player_win = "#{@player1} wins" if (player2_array + i).uniq.length == 4
      end
    end
    player_win
  end
end
# rubocop:enable Style/GlobalVars, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
