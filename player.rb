# frozen_string_literal: true

# Player Class for holding logic related to players
class Player
  attr_accessor :score
  attr_reader :player

  def initialize(player)
    @name = player
    @score = 0
  end

  def increment_score
    self.score += 1
  end
end

# test
player_one = Player.new('player_one')
player_one.increment_score
p player_one.score
