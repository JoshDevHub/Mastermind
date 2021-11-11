# frozen_string_literal: true

require_relative 'player'

# CodeMaker class that inherits from Player and holds logic for the player creating
# the code.
class CodeMaker < Player
  def make_code
    code = ''
    4.times do
      code += rand(1..6).to_s
    end
    code
  end
end

# test
new_computer = CodeMaker.new('computer')
p new_computer.make_code
