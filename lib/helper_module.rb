module Helper
    def self.welcome_player
        puts 'Welcome player 1, please enter your name?'
        player1_name = gets.chomp
        puts 'Welcome player 2, please enter your name?'
        player2_name = gets.chomp
        [player1_name, player2_name] 
    end

    def self.prompt_users(param)
      user_prompt = "#{param} - Please enter a value between 1-9"
      puts user_prompt
      player1_choice = gets.chomp.to_i
      if player1_choice.between?(1, 9)
        player1_choice
      else
        self.prompt_users(param)
      end
    end

    def self.end_game(par)
      puts par
      puts 'Play again? (Y/N)'
      user_in = gets.chomp.downcase
      self.end_game(par) unless %w[y and n].include?(user_in)
      return user_in
    end
end