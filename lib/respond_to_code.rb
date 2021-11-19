# frozen_string_literal: true

# Reponse Module for responding to a code guess.
module RespondToCode
  # TODO: Refactor this mess
  def guess_response(code_to_check, guess)
    matches = guess.map.with_index { |element, index| element == code_to_check[index] || element }
    match_count = matches.count(true)
    match_feed = matches.reject.with_index { |element, index| element == true }
    code_clone = code_to_check.reject.with_index { |element, index| element == guess[index] }
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
