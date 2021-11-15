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

  def remove_module(mod)
    metaclass = class << self; self end
    mod.instance_methods.each { |method_name| metaclass.class_eval { undef_method(method_name.to_sym) } }
  end

  def take_code_input
    input = gets_user_input
    return input if valid_input?(input)

    sanitize_user_input
  end

  def gets_user_input
    gets.chomp.downcase.delete(' ').split('')
  end

  def sanitize_user_input
    is_valid = false
    correct_input = ''
    until is_valid
      puts 'Invalid input. Please only use four numbers and only use digits between 1 and 6'
      correct_input = gets_user_input
      is_valid = valid_input?(correct_input)
    end
    correct_input
  end

  def valid_input?(code)
    code.length == 4 && code.all? { |number| '123456'.include?(number) }
  end
end

# test
# my_player = Player.new('Josh')
# my_player.extend CodeMaster
# my_code = my_player.make_code
# p my_code