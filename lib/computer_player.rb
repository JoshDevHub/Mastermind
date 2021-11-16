# frozen_string_literal: true

require_relative 'player'

# ComputerPlayer class that holds logic for the computer randomly generating
# the master code and for the guessing algorithm it uses when the player is Code
# Master
class ComputerPlayer < Player
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
