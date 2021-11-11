# frozen_string_literal: true

# require 'pry-byebug'
require_relative 'lib/game'

# main script to be run here
my_game = Game.new('computer', 'Josh')
new_board = my_game.create_board
loop do
  # binding.pry
  guess = my_game.player_two.make_guess
  response = new_board.guess_response(guess)
  new_board.format_response(response)
  my_game.end_game
  my_game.increment_round
  my_game.player_one.increment_score
end
