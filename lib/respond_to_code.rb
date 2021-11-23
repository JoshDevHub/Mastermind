# frozen_string_literal: true

# Reponse Module for generating a response to a code guess. Compares two codes
# and outputs a response hash telling how similar the two codes are.
module RespondToCode
  def guess_response(code_to_check, guess)
    filtered_code = code_to_check.reject.with_index { |element, index| element == guess[index] }
    filtered_guess = guess.reject.with_index { |element, index| element == code_to_check[index] }
    match_count = code_to_check.length - filtered_code.length
    imp_matches = find_imperfect_matches(filtered_guess, filtered_code)
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
