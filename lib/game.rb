# frozen_string_literal: true

require_relative 'user_player'
require_relative 'computer_player'
require_relative 'display'
require_relative 'game_loop'

# Game Class that holds logic for progressing & deciding the game
class Game
  attr_reader :user_player, :computer_player

  include Display

  def initialize
    setup
  end

  def play_game
    start_game
    loop do
      reset
      user_master = user_player.master_first?
      GameLoop.new(user: @user_player, computer: @computer_player, user_master: user_master).play_round
      between_games
      GameLoop.new(user: @user_player, computer: @computer_player, user_master: !user_master).play_round
      end_game
      break unless user_player.play_again?
    end
  end

  private

  def start_game
    introduction_message
    puts 'Press Enter to start the game!'
    gets.chomp
  end

  def setup
    @user_player = UserPlayer.new
    @computer_player = ComputerPlayer.new
  end

  def reset
    setup
  end

  def between_games
    score_display(user_player.score, computer_player.score)
    puts 'The players will now switch sides.'
  end

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
