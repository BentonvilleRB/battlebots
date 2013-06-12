require_relative 'test_helper'

require 'chaos_bot'

describe ChaosBot do
  
  it "has access to the previous move" do
  	chaos_bot = ChaosBot.new
  	move = chaos_bot.move
    chaos_bot.previous_move.must_equal(move)	
  end

end
