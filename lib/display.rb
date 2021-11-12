# frozen_string_literal: true

# Display Class that holds logic for the command line UI
class Display
  def initialize(player)
    @player_name = player
    @computer = 'Computer'
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
    puts 'Who should be Code Master first, you or the computer?'
  end

  def give_round_feedback(response)
    puts "Perfect Matches: #{response[:matches]}"
    puts "Imperfect Matches: #{response[:imp_matches]}"
    puts "None: #{response[:none]}"
  end
end

# test
display = Display.new('Josh')
display.give_round_feedback({ matches: 2, imp_matches: 1, none: 1 })
