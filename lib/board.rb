# frozen_string_literal: true

# Game board class
class Board
  attr_reader :code

  def initialize(code)
    @code = code.split('')
  end

  def guess_response(guess)
    # return hash with perfect matches, imperfect matches, and empties
    matches = guess.map.with_index { |element, index| element == @code[index] || element }
    match_count = matches.count(true)
    code_clone = @code.reject.with_index { |element, index| element == guess[index] }
    imp_matches = matches.count { |element| code_clone.include?(element) }
    {
      matches: match_count,
      imp_matches: imp_matches,
      none: 4 - (imp_matches + match_count)
    }
  end

  def format_response(response)
    p "Perfect matches: #{response[:matches]}"
    p "Imperfect matches: #{response[:imp_matches]}"
    p "Matched none: #{response[:none]}"
  end
end

# test
# my_code = %w[1 2 3 4]
# my_board = Board.new(my_code)
# new_guess = %w[1 3 3 4]
# p my_board.guess_response(new_guess)
