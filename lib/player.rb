# frozen_string_literal: true

require_relative 'code_master'
require_relative 'code_breaker'

# Player Class for holding logic related to players
class Player
  attr_accessor :score
  attr_reader :name

  def initialize(name)
    @name = name
    @score = 0
  end

  def increment_score
    self.score += 1
  end
end

# test
# my_player = Player.new('Josh')
# my_player.extend CodeMaster
# my_code = my_player.make_code
# p my_code
