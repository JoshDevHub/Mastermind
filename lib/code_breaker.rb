# frozen_string_literal: true

require_relative 'code_input'

# CodeBreaker Module that is selectively applied to Player Class and holds logic
# for how the Code Breaker plays
module CodeBreaker
  include CodeInput

  def computer_guess(code)
    code
  end
end
