# frozen_string_literal: true

# Game board class
class Board
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def guess_response(guess)
    # return hash with perfect matches, imperfect matches, and empties
    matches = guess.map.with_index { |element, index| element == @code[index] }.count(true)
    imp_matches = guess.count { |element| @code.include?(element) } - matches
    {
      matches: matches,
      imp_matches: imp_matches,
      none: (4 - (imp_matches + matches))
    }
  end

  def format_response(response)
    p "Perfect matches: #{response[:matches]}"
    p "Imperfect matches: #{response[:imp_matches]}"
    p "Matched none: #{response[:none]}"
  end
end

# test
# my_code = [1, 2, 3, 4]
# my_board = Board.new(my_code)
# new_guess = [1, 5, 2, 4]
# p my_board.guess_response(new_guess)
