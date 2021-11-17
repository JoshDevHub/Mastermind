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

  include Display

  def initialize
    @user_player = UserPlayer.new('User')
    @computer_player = ComputerPlayer.new('Computer')
    @round_number = 1
    @user_first = false
  end

  def round_computer_master
    board_code = @computer_player.make_code
    new_board = create_board(board_code)
    loop do
      # binding.pry
      code_query(@round_number)
      guess = @user_player.take_code_input
      response_hash = new_board.guess_response(guess)
      give_round_feedback(response_hash)
      increment_round
      break if check_win_condition(board_code, guess)
    end
  end

  def round_user_master
    create_master_code
    board_code = @user_player.take_code_input
    new_board = create_board(board_code)
    @computer_player.solve_code
  end

  def order
    order_query
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
    introduction
    gets_user_name
  end

  def gets_user_name
    user_name_query
    @user_player.name = gets.chomp
  end

  def play_game
    if @user_first
      round_user_master
      between_games(user_player, computer_player)
      round_computer_master
    else
      round_computer_master
      between_games(computer_player, user_player)
      round_user_master
    end
  end

  def main_game_loop
    loop do
      start_game
      order
      play_game
      define_winner
      break unless play_again?
    end
  end

  def between_games(master, breaker)
    master.score = @round_number
    update_between_games(master, breaker)
    @round_number = 1
  end

  # TODO: Move some of this logic to Display Module
  def define_winner
    puts "You scored #{@user_player.score} and the computer scored #{@computer_player.score}."
    if @user_player.score > @computer_player.score
      puts 'You WIN!'
    elsif @user_player.score < @computer_player.score
      puts 'You lose. The computers are taking over!'
    else
      puts 'This game was a draw'
    end
  end

  # TODO: sanizite input. rope in the Player method for yes/no responses.
  def play_again?
    puts 'Would you like to play again? Y/n'
    response = gets.chomp
    response == 'y'
  end
end

# test
# my_game = Game.new('Josh')
# my_game.order
# my_game.play_game
# # p my_game.player_order
