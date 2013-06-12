require_relative 'game'
require_relative 'game_bot'

class StubbornBot < GameBot
  attr_reader :move

  def initialize(name="Stubborn")
    super
    @move = Game::RULES.keys.sample
  end
  
end