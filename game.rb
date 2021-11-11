# frozen_string_literal: true

require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'board'

# Game Class that holds logic for progressing & deciding the game
class Game
  attr_accessor :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one = CodeMaker.new(player_one)
    @player_two = CodeBreaker.new(player_two)
  end

  def create_board(code = @player_one.make_code)
    Board.new(code)
  end
end

# test
# my_game = Game.new('computer', 'Josh')
# p my_game.player_one
