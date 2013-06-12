class GameBot

  attr_reader :name

  def initialize(name=nil)
    @name=name
  end

  def move
    raise 'Not Implimented'
  end

  def process_result(result)
    # available to all bots
  end

  def previous_move
    @move
  end
  
end