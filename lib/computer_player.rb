# frozen_string_literal: true

require_relative 'player'

# ComputerPlayer class that holds logic for the computer randomly generating
# the master code and for the guessing algorithm it uses when the player is Code
# Master
class ComputerPlayer < Player
  attr_reader :possibility_space

  def initialize(name)
    super(name)
    @code_array = *(1..6)
    @possibility_space = []
  end

  def populate_possibility_space
    @code_array.repeated_permutation(6) { |permutation| @possibility_space << permutation }
  end

  def make_code
    code = []
    4.times do
      code << rand(1..6).to_s
    end
    code
  end

  # TODO: Build this method
  def solve_code
    puts 'This is a placeholder'
  end
end

# test
my_ai = ComputerPlayer.new('Computer')
my_ai.solve_code
my_ai.populate_possibility_space
p my_ai.possibility_space
