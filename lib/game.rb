# frozen_string_literal: true

require 'pry-byebug'
require_relative 'user_player'
require_relative 'computer_player'
require_relative 'board'
require_relative 'display'

# Game Class that holds logic for progressing & deciding the game
class Game
  attr_accessor :user_player, :computer_player
  attr_reader :game_over, :game_display, :round_number

  def initialize(player_name)
    @user_player = UserPlayer.new(player_name)
    @computer_player = ComputerPlayer.new('Computer')
    @round_number = 1
    @user_first = false
    @game_display = Display.new
  end

  def round_computer_master
    board_code = @computer_player.make_code
    new_board = create_board(board_code)
    loop do
      # binding.pry
      @game_display.code_query(@round_number)
      guess = @user_player.take_code_input
      response_hash = new_board.guess_response(guess)
      @game_display.give_round_feedback(response_hash)
      increment_round
      break if check_win_condition(board_code, guess)
    end
  end

  def round_user_master
    @game_display.create_master_code
    board_code = @user_player.take_code_input
    new_board = create_board(board_code)
    @computer_player.solve_code
  end

  def order
    @game_display.order_query
    order_response = @user_player.player_order
    @user_first = true if order_response == 'y'
  end

  def increment_round
    @round_number += 1
  end

  def create_board(code)
    Board.new(code)
  end

  def check_win_condition(board_code, code_guess)
    @round_number > 12 || board_code == code_guess
  end

  def start_game
    @game_display.introduction
    player_choice = player_order
    control_player_order(player_choice)
  end

  def play_game
    if @user_first
      round_user_master
      between_games(user_player, computer_player)
      round_computer_master
      # TODO: End game logic
    else
      round_computer_master
      between_games(computer_player, user_player)
      round_user_master
      # TODO: End game logic
    end
  end

  def between_games(master, breaker)
    master.score = @round_number
    @game_display.update_between_games(master, breaker)
  end

  def end_game
    puts "#{@player_two.name} has guessed correctly!"
    puts "#{@player_one.name} gets #{@player_one.score}."
  end
end

# test
my_game = Game.new('Josh')
my_game.order
my_game.play_game
# p my_game.player_order
