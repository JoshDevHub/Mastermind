# frozen_string_literal: true

# Game board class
class Board
  attr_reader :code

  def initialize(code)
    @code = code
  end

  # FIXME: Refactor to be cop compliant and less messy
  def guess_response(guess)
    # return hash with perfect matches, imperfect matches, and empties
    matches = guess.map.with_index { |element, index| element == @code[index] || element }
    match_count = matches.count(true)
    match_feed = matches.reject.with_index { |element, index| element == true }
    code_clone = @code.reject.with_index { |element, index| element == guess[index] }
    p code_clone
    imp_matches = find_imperfect_matches(match_feed, code_clone)
    {
      matches: match_count,
      imp_matches: imp_matches,
      none: 4 - (imp_matches + match_count)
    }
  end

  def find_imperfect_matches(guess, code_clone)
    matches = guess.map do |element|
      if code_clone.include?(element)
        code_index = code_clone.index(element)
        element = true
        code_clone.delete_at(code_index)
      end
      element
    end
    matches.count(true)
  end
end

# test
# my_code = %w[3 3 1 1]
# my_board = Board.new(my_code)
# new_guess = %w[1 1 3 3]
# p my_board.guess_response(new_guess)
