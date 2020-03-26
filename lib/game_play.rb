require_relative './helper_module.rb' 

class Play
    def initialize(current_player)
        @current_player = current_player
    end
    def player_sign(param1)
        players_sign = @current_player == param1 ? 'X' : 'O'
        players_sign
    end
end

