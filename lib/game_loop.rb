# frozen_string_literal: true

require 'pry-byebug'
require_relative 'display'
require_relative 'computer_player'
require_relative 'user_player'
require_relative 'respond_to_code'

# Game Loop class that runs the code guessing loop for the game.
class GameLoop
  include Display
  include RespondToCode

  attr_reader :computer, :user

  def initialize(user:, computer:, user_master:)
    @user = user
    @computer = computer
    @user_master = user_master
  end

  def play_round
    if @user_master
      play_user_master_round
    else
      play_computer_master_round
    end
  end

  private

  def game_over?(round, master_code, code_guess)
    master_code == code_guess || round == 12
  end

  def loop_computer_master(master_code)
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
    puts query_message[:create_code_query]
    master_code = computer.create_master_code
    round = 1
    loop do
      guess = loop_computer_master(master_code)[:guess]
      round += 1
      break if game_over?(round, master_code, guess)
    end
    round
  end

  def play_user_master_round_test
    puts 'This is a placeholder'
  end

  def play_user_master_round
    puts query_message[:guess_code_query]
    master_code = user.gets_code_input
    round = 1
    result = first_loop_user_master(master_code)
    round += 1
    return result if game_over?(round, master_code, result[:guess])

    loop do
      result = subsequent_loops_user_master(master_code, result[:guess], result[:response])
      round += 1
      break if game_over?(round, master_code, result[:guess])
    end
    round
  end

  def first_loop_user_master(master_code)
    # binding.pry
    code_guess = computer.solve_code
    response_hash = guess_response(master_code, code_guess)
    round_feedback_message(response_hash)
    {
      guess: code_guess,
      response: response_hash
    }
  end

  def subsequent_loops_user_master(master_code, guess, response)
    # binding.pry
    code_guess = computer.solve_code(guess, response)
    response_hash = guess_response(master_code, code_guess)
    round_feedback_message(response_hash)
    {
      guess: code_guess,
      response: response_hash
    }
  end
end
