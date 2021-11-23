# frozen_string_literal: true

# Player Class for holding logic related to players
class Player
  # TODO: Consider name and its usefulness?
  attr_accessor :name
  attr_reader :score

  def initialize(name)
    @name = name
    @score = 0
  end

  def increment_score
    @score += 1
  end
end
