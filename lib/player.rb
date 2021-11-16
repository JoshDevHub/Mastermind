# frozen_string_literal: true

# Player Class for holding logic related to players
class Player
  attr_accessor :score, :name

  def initialize(name)
    @name = name
    @score = 0
  end
end

# test
# my_player = Player.new('Josh')
# my_player.extend CodeMaster
# my_code = my_player.make_code
# p my_code
