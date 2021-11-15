# frozen_string_literal: true

# CodeMaster Module that is selectively applied to Player Class and holds logic
# for how the Code Master plays the game
module CodeMaster
  def make_code
    code = ''
    4.times do
      code += rand(1..6).to_s
    end
    code
  end

  def test_method
    puts 'This is a test'
  end
end

# test
# new_computer = CodeMaker.new('computer')
# new_code = new_computer.make_code
# new_code
