# frozen_string_literal: true

require_relative 'code_master'
require_relative 'code_breaker'
require_relative 'player'
require_relative 'board'
require_relative 'display'

# Game Class that holds logic for progressing & deciding the game
class Game
  attr_accessor :player_one, :player_two
  attr_reader :game_over, :game_display

  def initialize(player_name)
    @player_one = Player.new(player_name)
    @player_two = Player.new('Computer')
    @round_number = 0
    @game_over = false
    @game_display = Display.new
  end

  def player_order
    @game_display.order_query
    order = gets.chomp.downcase
    sanitize_yes_no_input(order)
  end

  def valid_yes_no_input?(input)
    %w[y n].include?(input)
  end

  def sanitize_yes_no_input(input)
    return input if valid_yes_no_input?(input)

    correct_input = ''
    is_valid = false
    until is_valid
      @game_display.alt_order_query
      correct_input = gets.chomp.downcase
      is_valid = valid_yes_no_input?(correct_input)
    end
    correct_input
  end

  def control_player_order(order)
    if order == 'y'
      @player_one.extend CodeMaster
      @player_two.extend CodeBreaker
    else
      @player_one.extend CodeBreaker
      @player_two.extend CodeMaster
    end
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

  def start_game
    @game_display.introduction
    player_choice = player_order
    control_player_order(player_choice)
  end

  def end_game
    puts "#{@player_two.name} has guessed correctly!"
    puts "#{@player_one.name} gets #{@player_one.score}."
  end
end

# test
# my_game = Game.new('Computer', 'Josh')
# # my_game.check_win_condition(13, '1234', '1243')
# p my_game.player_order
