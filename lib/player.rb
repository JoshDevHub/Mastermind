# frozen_string_literal: true

# Player Class for holding logic related to players
class Player
  attr_reader :score

  def initialize
    @score = 0
  end

  def increment_score
    @score += 1
  end
end
