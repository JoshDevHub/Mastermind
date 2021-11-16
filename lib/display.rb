# frozen_string_literal: true

# Display Class that holds logic for the command line UI
class Display
  def initialize
    @rules = <<~HEREDOC
      The rules are as follows: the game has two roles: a Code Master and a
      Code Breaker. The Code Master creates a code of their choosing by selecting
      four numbers among the digits 1-6. The Code Breaker must try to guess the
      code, and, between guesses, they will get feedback on how
      accurate their guess was. Each perfect match indicates that a digit in
      their guess has both the correct value and occupies the same position as a
      corresponding digit in the Code Master's code. Each imperfect match
      indicates that a digit's value is present in the Code Master's code -- but
      is in the wrong position. Feedback of 'none' indicates a digit that is not
      present at all in the Code Master's code.

      The Code Master is awarded a point for every guess the Code Breaker makes.
      After the Code Breaker gets the correct guess or reaches the maximum number of
      guesses (12), the points are tallied and the players switch roles. After the
      second round, the player with the most points wins!
    HEREDOC
  end

  def introduction
    puts 'Welcome to a game of Mastermind!'
    puts @rules
  end

  def order_query
    puts 'Would you like to be Code Master first? Y/n'
  end

  def alt_order_query
    puts 'Invalid input. Would you like to be Code Master first? Y/n'
  end

  def code_query(round_number)
    puts "Round Number: #{round_number}"
    puts 'Code Breaker, enter your guess for a code.'
  end

  def create_master_code
    puts 'What code would you like the Computer to try to guess?'
  end

  # FIXME: Bug in this currently that needs to be tracked down. Player scores stay at 0.
  def update_between_games(player_one, player_two)
    puts "#{player_two.name} scored #{player_two.score} points that game."\
    "We will now switch sides and #{player_one.name} will be the Code Master."
  end

  def give_round_feedback(response)
    puts "Perfect Matches: #{response[:matches]}"
    puts "Imperfect Matches: #{response[:imp_matches]}"
    puts "None: #{response[:none]}"
  end

  def end_round(player_one, player_two)
    puts "#{player_one.name} got #{player_one.score} points this round."
    puts "The players will now switch roles. #{player_one.name} will be the Code"
    puts "Breaker and #{player_two.name} will be the Code Maker"
  end
end

# test
