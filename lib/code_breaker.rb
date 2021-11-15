# frozen_string_literal: true

# CodeBreaker Module that is selectively applied to Player Class and holds logic
# for how the Code Breaker plays
module CodeBreaker
  def make_guess
    p 'Input four numbers between 1 and 6 to make your guess'
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
      p 'Invalid input. Please only guess four numbers and only use digits between 1 and 6'
      correct_input = gets_user_input
      is_valid = valid_input?(correct_input)
    end
    correct_input
  end

  def valid_input?(code)
    code.length == 4 && code.all? { |number| '123456'.include?(number) }
  end
end
