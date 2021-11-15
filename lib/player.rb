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
end

# test
