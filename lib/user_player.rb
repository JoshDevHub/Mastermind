# frozen_string_literal: true

require_relative 'player'
require_relative 'display'

# UserPlayer class that holds the logic for getting user inputs into the game
# TODO: Move certain things into the Display Module
class UserPlayer < Player
  include Display

  def take_code_input
    input = gets_user_code_input
    return input if valid_input?(input)

    sanitize_user_input
  end

  def gets_user_code_input
    gets.chomp.downcase.delete(' ').split('')
  end

  def sanitize_user_code_input
    is_valid = false
    correct_input = ''
    until is_valid
      puts 'Invalid input. Please only use four numbers and only use digits between 1 and 6'
      correct_input = gets_user_input
      is_valid = valid_input?(correct_input)
    end
    correct_input
  end

  def valid_input?(code)
    code.length == 4 && code.all? { |number| '123456'.include?(number) }
  end

  def player_order
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
      puts 'Invalid input. Please use Y or N to respond'
      correct_input = gets.chomp.downcase
      is_valid = valid_yes_no_input?(correct_input)
    end
    correct_input
  end
end
