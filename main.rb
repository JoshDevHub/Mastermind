# frozen_string_literal: true

require 'pry-byebug'
require_relative 'lib/game'

# main script to be run here
my_game = Game.new
my_game.main_game_loop
