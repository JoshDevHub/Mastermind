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
    @possibility_space = populate_possibility_space
  end

  def populate_possibility_space
    possibility_space = []
    @code_array.repeated_permutation(4) { |permutation| possibility_space << permutation }
    possibility_space
  end

  def create_master_code
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
