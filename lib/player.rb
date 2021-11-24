# frozen_string_literal: true

# Player Class for holding player score
class Player
  attr_reader :score

  def initialize
    @score = 0
  end

  def increment_score
    @score += 1
  end
end
