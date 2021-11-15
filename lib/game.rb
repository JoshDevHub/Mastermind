# frozen_string_literal: true

require_relative 'user_player'
require_relative 'computer_player'
require_relative 'board'
require_relative 'display'

# Game Class that holds logic for progressing & deciding the game
class Game
  attr_accessor :user_player, :computer_player
  attr_reader :game_over, :game_display

  def initialize(player_name)
    @user_player = UserPlayer.new(player_name)
    @computer_player = ComputerPlayer.new('Computer')
    @round_number = 0
    @game_over = false
    @game_display = Display.new
  end

  # TODO: Move following 3 methods to user_player
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
      computer_breaker_user_master
    else
      computer_master_user_breaker
    end
  end

  def computer_master_user_breaker
    @player_one.extend CodeBreaker
    @player_two.extend CodeMaster
  end

  def computer_breaker_user_master
    @player_one.extend CodeMaster
    @player_two.extend CodeBreaker
  end

  def increment_round
    @round_number += 1
  end

  def create_board(code = @player_two.make_code)
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

  def play_round(board)
    @game_display.code_query
    if @player_one.methods.include? :make_code
      puts 'Placeholder logic'
    else
      play_round_user_breaker(board)
    end
  end

  def play_round_user_breaker(board)
    code_guess = @player_one.take_code_input
    response = board.guess_response(code_guess)
    @game_display.give_round_feedback(response)
    check_win_condition(board.code, code_guess)
    player_one.increment_score
    increment_round
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

# TODO: full refactor into the current player dynamic
# TODO: have the game fully functional with the placeholder of the computer
#       player guessing the user's code when computer is Breaker.
