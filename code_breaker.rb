# frozen_string_literal: true

require_relative 'player'

# CodeBreaker class that inherits from Player and holds logic for the player
# currently guessing the secret code.
class CodeBreaker < Player
  def make_guess
    p 'Input four numbers between 1 and 6 to make your guess'
    gets.chomp.downcase.delete(' ').split('')
  end
end

# test
# player = CodeBreaker.new('player_one')
# p player.verify_code(%w[1 2 3 7])
