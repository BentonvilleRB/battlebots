require_relative 'test_helper'

require 'learning_bot'

describe LearningBot do
  
  describe "winning_move" do

		# =================
		# Scissors cut paper
		# Paper covers rock
		# Rock crushes lizard
		# Lizard poisons Spock
		# Spock smashes (or melts) scissors
		# Scissors decapitate lizard
		# Lizard eats paper
		# Paper disproves Spock
		# Spock vaporizes rock
		# Rock breaks scissors
	  it "returns the winning move" do
	  	learning_bot = LearningBot.new
	  	learning_bot.winning_move(:scissors).must_equal([:rock, :spock])
	  	learning_bot.winning_move(:paper).must_equal(   [:scissors, :lizard])
	  	learning_bot.winning_move(:rock).must_equal(    [:paper, :spock])
	  	learning_bot.winning_move(:spock).must_equal(   [:paper, :lizard])
	  	learning_bot.winning_move(:lizard).must_equal(  [:scissors, :rock])	
	  end
	end

end