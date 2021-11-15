# frozen_string_literal: true

require 'pry-byebug'
require_relative 'lib/game'

# main script to be run here
my_game = Game.new('User Name')
my_game.start_game
game_board = my_game.create_board
loop do
  my_game.play_round(game_board)
  break if my_game.game_over
end

# my_game.play_round(game_board)
# new_board = my_game.create_board
# Refactoring Game Loop. Commented out for reference while refactoring
# loop do
#   # binding.pry
#   guess = my_game.player_two.make_guess
#   response = new_board.guess_response(guess)
#   new_board.format_response(response)
#   my_game.increment_round
#   my_game.player_one.increment_score
#   my_game.check_win_condition(new_board.code, guess)
#   if my_game.game_over
#     my_game.end_game
#     break
#   end
# end


