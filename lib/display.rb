# frozen_string_literal: true

# TODO: Look into ways to make the display spacing better. Maybe add colors?
# Display Module that holds logic for the command line UI
module Display
  @@rules = <<~HEREDOC
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

  def introduction_message
    puts 'Welcome to a game of Mastermind!'
    puts @@rules
  end

  def query_message
    {
      username_query: 'What is your name?',
      order_query: 'Would you like to be Code Master first? Y/n',
      create_code_query: 'Code Master, what would you like the Code Breaker to guess?',
      guess_code_query: 'Code Breaker, what is your guess for the code?',
      play_again_query: 'Would you like to play again? Y/n'
    }
  end

  def computer_message(message = nil)
    {
      create_code: 'The computer has created a code for you to guess.',
      computer_guess: "The computer has guessed #{message}"
    }
  end

  def error_message
    {
      code_error: 'Invalid input. Please enter 4 numbers using only digits 1-6',
      yes_no_error: 'Invalid input. Please only use Y or N'
    }
  end

  def round_feedback_message(response)
    puts "Perfect Matches: #{response[:matches]}"
    puts "Imperfect Matches: #{response[:imp_matches]}"
    puts "None: #{response[:none]}"
  end

  def score_display(user_score, computer_score)
    puts "The score is User: #{user_score} - Computer: #{computer_score}"
  end
end
