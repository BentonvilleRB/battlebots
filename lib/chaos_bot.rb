require_relative 'game'
require_relative 'game_bot'

class ChaosBot < GameBot

  def move
    @move = Game::RULES.keys.sample
  end

end