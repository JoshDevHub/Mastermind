# frozen_string_literal: true

require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'board'

# Game Class that holds logic for progressing & deciding the game
class Game
  attr_accessor :player_one, :player_two
  attr_reader :end_game

  def initialize(player_one, player_two)
    @player_one = CodeMaker.new(player_one)
    @player_two = CodeBreaker.new(player_two)
    @end_game = false
  end

  def create_board(code = @player_one.make_code)
    Board.new(code)
  end

  def check_win_condition(round_number, board_code, code_guess)
    @end_game = true if round_number > 12 || board_code == code_guess
  end
end

# test
# my_game = Game.new('computer', 'Josh')
# my_game.check_win_condition(13, '1234', '1243')
# p my_game.end_game
