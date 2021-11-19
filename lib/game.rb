# frozen_string_literal: true

require 'pry-byebug'
require_relative 'user_player'
require_relative 'computer_player'
require_relative 'display'
require_relative 'game_loop'

# Game Class that holds logic for progressing & deciding the game
class Game
  attr_accessor :user_player, :computer_player

  include Display

  def initialize
    @user_player = UserPlayer.new('User') # TODO: More elegant solution for this parameter
    @computer_player = ComputerPlayer.new('Computer')
  end

  def start_game
    introduction_message
    puts query_message[:username_query]
    @user_player.name = @user_player.gets_user_input
  end

  def master_first?
    puts query_message[:order_query]
    order_response = @user_player.gets_yes_no_input
    order_response == 'y'
  end

  def play_again?
    puts query_message[:play_again_query]
    response = @user_player.gets_yes_no_input
    response == 'y'
  end

  def test_game_loop
    # binding.pry
    start_game
    user_master = master_first?
    first_round = GameLoop.new(user: @user_player, computer: @computer_player, user_master: user_master)
    first_round.play_round
    between_games
    second_round = GameLoop.new(user: @user_player, computer: @computer_player, user_master: !user_master)
    second_round.play_round
    end_game
    # play again?
  end

  # TODO: Move as much of this to Display as possible
  def between_games
    score_display(user_player.score, computer_player.score)
    puts 'The players will now switch sides.'
  end

  # TODO: Move as much of this to Display as possible
  def end_game
    score_display(user_player.score, computer_player.score)
    if user_player.score > computer_player.score
      puts "You've won the game. Congratulations!"
    elsif user_player.score < computer_player.score
      puts "You've lost the game. The computers are taking over!"
    else
      puts 'This game was a draw'
    end
  end
end

Game.new.test_game_loop
