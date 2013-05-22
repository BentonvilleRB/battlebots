require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/game'

describe Game do
  
  describe "RULES" do

	  it "has rules" do
	  	Game::RULES.wont_be_nil 
	  end

	  it "returns TIE if the same move is used" do
	  	Game.play!(:scissors, :scissors).must_equal("TIE")
	  end

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
	  	Game.play!(:scissors, :paper ).must_equal(:scissors)
	  	Game.play!(:scissors, :lizard).must_equal(:scissors)
	  	Game.play!(:paper, :scissors ).must_equal(:scissors)
	  	Game.play!(:lizard, :scissors).must_equal(:scissors)

	  	Game.play!(:paper, :rock ).must_equal(:paper)
	  	Game.play!(:paper, :spock).must_equal(:paper)	
	  	Game.play!(:rock, :paper ).must_equal(:paper)
	  	Game.play!(:spock, :paper).must_equal(:paper)	

	  	Game.play!(:rock, :lizard  ).must_equal(:rock)	
	  	Game.play!(:rock, :scissors).must_equal(:rock)	
	  	Game.play!(:lizard,   :rock).must_equal(:rock)	
	  	Game.play!(:scissors, :rock).must_equal(:rock)	

	  	Game.play!(:lizard, :spock).must_equal(:lizard)	
	  	Game.play!(:lizard, :paper).must_equal(:lizard)	
	  	Game.play!(:spock, :lizard).must_equal(:lizard)	
	  	Game.play!(:paper, :lizard).must_equal(:lizard)		  	

	  	Game.play!(:spock, :scissors).must_equal(:spock)	
	  	Game.play!(:spock, :rock    ).must_equal(:spock)	
	  	Game.play!(:scissors, :spock).must_equal(:spock)	
	  	Game.play!(:rock, :spock    ).must_equal(:spock)		  	
	  end

	end

end