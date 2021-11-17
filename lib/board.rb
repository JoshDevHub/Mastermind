# frozen_string_literal: true

require_relative 'respond_to_code'

# Game board class
class Board
  include RespondToCode

  attr_reader :code

  def initialize(code)
    @code = code
  end

  def respond_to_master_code_guess(guess)
    guess_response(code, guess)
  end
end

# test
# my_code = %w[3 3 1 1]
# my_board = Board.new(my_code)
# new_guess = %w[1 1 3 3]
# p my_board.guess_response(new_guess)
