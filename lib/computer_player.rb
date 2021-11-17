# frozen_string_literal: true

require_relative 'player'
require_relative 'respond_to_code'

# ComputerPlayer class that holds logic for the computer randomly generating
# the master code and for the guessing algorithm it uses when the player is Code
# Master
class ComputerPlayer < Player
  include RespondToCode

  attr_reader :possibility_space, :code_array

  def initialize(name)
    super(name)
    @code_array = (1..6).to_a.map(&:to_s)
    @possibility_space = []
  end

  def populate_possibility_space
    @code_array.repeated_permutation(4) { |permutation| @possibility_space << permutation }
  end

  def make_code
    code = []
    4.times do
      code << rand(1..6).to_s
    end
    code
  end

  def filter_possibilities(guess, response)
    @possibility_space = possibility_space.select { |array| guess_response(guess, array) == response }
  end

  # TODO: Build this method
  def solve_code(guess = %w[1 1 2 2], response = nil)
    return guess if response.nil?

    filter_possibilities(guess, response)
    possibility_space.min
  end
end

# test
# my_ai = ComputerPlayer.new('Computer')
# my_ai.code_array
# my_ai.populate_possibility_space
# my_ai.possibility_space
# guess = my_ai.solve_code
# the_response = my_ai.guess_response(%w[1 2 3 4], %w[1 1 2 2])
# new_guess = my_ai.solve_code(guess, the_response)
# new_response = my_ai.guess_response(%w[1 2 3 4], %w[1 2 3 3])
# p my_ai.solve_code(new_guess, new_response)
