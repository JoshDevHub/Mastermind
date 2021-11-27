# frozen_string_literal: true

require_relative 'display'
require_relative 'respond_to_code'

# Game Loop class that runs the code guessing loop for the game.
class GameLoop
  include Display
  include RespondToCode

  attr_reader :computer, :user, :user_master

  def initialize(user:, computer:, user_master:)
    @user = user
    @computer = computer
    @user_master = user_master
  end

  def play_round
    if user_master
      play_user_master_round
    else
      play_computer_master_round
    end
  end

  private

  def continue
    puts 'Press enter to continue.'
    gets.chomp
  end

  def game_over?(number, master_code, code_guess)
    puts 'Correct guess!' if master_code == code_guess
    puts "You've reached the maximum number of guesses. The code was #{master_code.join}." if number == 12
    master_code == code_guess || number == 12
  end

  def loop_computer_master(master_code)
    round_message(computer.score)
    puts query_message[:guess_code_query]
    code_guess = user.gets_code_input
    response_hash = guess_response(master_code, code_guess)
    round_feedback_message(response_hash)
    {
      guess: code_guess,
      response: response_hash
    }
  end

  def play_computer_master_round
    master_code = computer.create_master_code
    puts computer_message[:create_code]
    computer.increment_score
    loop do
      guess = loop_computer_master(master_code)[:guess]
      break if game_over?(computer.score, master_code, guess)

      computer.increment_score
    end
  end

  def play_user_master_round
    master_code = user.create_code
    user.increment_score
    result = first_loop_user_master(master_code)
    return result if game_over?(user.score, master_code, result[:guess])

    loop do
      user.increment_score
      result = subsequent_loops_user_master(master_code, result[:guess], result[:response])
      break if game_over?(user.score, master_code, result[:guess])
    end
  end

  def first_loop_user_master(master_code)
    round_message(user.score)
    code_guess = computer.solve_code
    puts computer_message(code_guess.join)[:computer_guess]
    response_hash = guess_response(master_code, code_guess)
    round_feedback_message(response_hash)
    continue
    {
      guess: code_guess,
      response: response_hash
    }
  end

  def subsequent_loops_user_master(master_code, guess, response)
    round_message(user.score)
    code_guess = computer.solve_code(guess, response)
    puts computer_message(code_guess.join)[:computer_guess]
    response_hash = guess_response(master_code, code_guess)
    round_feedback_message(response_hash)
    continue
    {
      guess: code_guess,
      response: response_hash
    }
  end
end
