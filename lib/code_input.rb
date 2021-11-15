# frozen_string_literal: true

# CodeInput module for getting and sanitizing user code input.
module CodeInput
  def take_code_input
    input = gets_user_input
    return input if valid_input?(input)

    sanitize_user_input
  end

  def gets_user_input
    gets.chomp.downcase.delete(' ').split('')
  end

  def sanitize_user_input
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
end
