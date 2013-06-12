require_relative 'test_helper'

require 'game'

describe Game do
  
  describe "RULES" do

	  it "has rules" do
	  	Game::RULES.wont_be_nil 
	  end

	  it "returns TIE if the same move is used" do
	  	Game.play!(:scissors, :scissors)[:winner].must_equal("TIE")
	  end

		# # =================
		# # Scissors cut paper
		# # Paper covers rock
		# # Rock crushes lizard
		# # Lizard poisons Spock
		# # Spock smashes (or melts) scissors
		# # Scissors decapitate lizard
		# # Lizard eats paper
		# # Paper disproves Spock
		# # Spock vaporizes rock
		# # Rock breaks scissors
	  it "returns the winning player" do
	  	Game.play!(:scissors, :paper )[:winner].must_equal("player1")
	  	Game.play!(:scissors, :lizard)[:winner].must_equal("player1")
	  	Game.play!(:paper, :scissors )[:winner].must_equal("player2")
	  	Game.play!(:lizard, :scissors)[:winner].must_equal("player2")

	  	Game.play!(:paper, :rock )[:winner].must_equal("player1")
	  	Game.play!(:paper, :spock)[:winner].must_equal("player1")	
	  	Game.play!(:rock, :paper )[:winner].must_equal("player2")
	  	Game.play!(:spock, :paper)[:winner].must_equal("player2")

	  	Game.play!(:rock, :lizard  )[:winner].must_equal("player1")
	  	Game.play!(:rock, :scissors)[:winner].must_equal("player1")
	  	Game.play!(:lizard,   :rock)[:winner].must_equal("player2")
	  	Game.play!(:scissors, :rock)[:winner].must_equal("player2")

	  	Game.play!(:lizard, :spock)[:winner].must_equal("player1")
	  	Game.play!(:lizard, :paper)[:winner].must_equal("player1")
	  	Game.play!(:spock, :lizard)[:winner].must_equal("player2")
	  	Game.play!(:paper, :lizard)[:winner].must_equal("player2")	  	

	  	Game.play!(:spock, :scissors)[:winner].must_equal("player1")
	  	Game.play!(:spock, :rock    )[:winner].must_equal("player1")
	  	Game.play!(:scissors, :spock)[:winner].must_equal("player2")
	  	Game.play!(:rock, :spock    )[:winner].must_equal("player2")
	  end

	  it "detects an invalid move by player1" do
	  	assert_raises(RuntimeError) { Game.play!(:cheat, :spock) }
	  end

	  it "detects an invalid move by player2" do
	  	assert_raises(RuntimeError) { Game.play!(:rock, :cheat) }
	  end

	end

end