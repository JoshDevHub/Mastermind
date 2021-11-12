# frozen_string_literal: true

require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'board'

# Game Class that holds logic for progressing & deciding the game
class Game
  attr_accessor :player_one, :player_two
  attr_reader :game_over

  def initialize(player_one, player_two)
    @player_one = CodeMaker.new(player_one)
    @player_two = CodeBreaker.new(player_two)
    @round_number = 0
    @game_over = false
  end

  def increment_round
    @round_number += 1
  end

  def create_board(code = @player_one.make_code)
    Board.new(code)
  end

  def check_win_condition(board_code, code_guess)
    @game_over = true if @round_number > 12 || board_code == code_guess
  end

  def end_game
    p "#{@player_two.name} has guessed correctly!"
    p "#{@player_one.name} gets #{@player_one.score}."
  end
end

# test
# my_game = Game.new('computer', 'Josh')
# my_game.check_win_condition(13, '1234', '1243')
# p my_game.end_game
