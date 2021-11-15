# frozen_string_literal: true

require 'pry-byebug'
require_relative 'lib/game'

# main script to be run here
my_game = Game.new('User Name')
my_game.start_game
game_board = my_game.create_board
loop do
  binding.pry
  my_game.play_round(game_board)
  break if my_game.game_over
end
my_game.game_display.update_between_games(my_game.player_one, my_game.player_two) # FIXME: broken scoring currently
second_game = Game.new('User Name')
second_game.computer_master_user_breaker
second_game.game_display.create_master_code
user_code = second_game.player_one.take_code_input
second_game_board = second_game.create_board(user_code)
loop do
  second_game.play_round(second_game_board)
  break if second_game.game_over
end

# TODO: Full refactor to cooperate with new Player organization and incoming
#       game refactor.
# TODO: Push as much logic as possible into Game. Keep procedural stuff here as
#       tidy as possible
