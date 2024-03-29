# frozen_string_literal: true

require_relative 'player'
require_relative 'display'

# UserPlayer class that holds the logic for getting user inputs into the game
class UserPlayer < Player
  include Display

  def gets_code_input
    input = gets_user_input.delete(' ').split('')
    return input if valid_code_input?(input)

    until valid_code_input?(input)
      puts error_message[:code_error]
      input = gets_user_input.delete(' ').split('')
    end
    input
  end

  def gets_user_input
    gets.chomp.downcase
  end

  def valid_code_input?(code)
    code.length == 4 && code.all? { |number| '123456'.include?(number) }
  end

  def gets_yes_no_input
    input = gets_user_input
    return input if valid_yes_no_input?(input)

    until valid_yes_no_input?(input)
      puts error_message[:yes_no_error]
      input = gets_user_input
    end
    input
  end

  def valid_yes_no_input?(input)
    %w[y n].include?(input)
  end

  def input_username
    puts query_message[:username_query]
    self.name = gets_user_input
  end

  def master_first?
    puts query_message[:order_query]
    gets_yes_no_input == 'y'
  end

  def play_again?
    puts query_message[:play_again_query]
    gets_yes_no_input == 'y'
  end

  def create_code
    puts query_message[:create_code_query]
    gets_code_input
  end
end
