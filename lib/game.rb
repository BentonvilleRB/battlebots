

# Summary of Rules
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

module Game

	RULES = {
		scissors: [:paper, :lizard],
		paper: 	  [:rock, :spock],
		rock:     [:lizard, :scissors],
		lizard:   [:spock, :paper],
		spock:    [:scissors, :rock]
	}

	# def initialize(player1, player2)
	# 	@player1 = player1
	# 	@player2 = player2
	# end

	def self.play!(player1_move, player2_move)
		# validate both players move!

		return "TIE" if player1_move == player2_move

		return player1_move if RULES[player1_move].include?(player2_move)
		return player2_move if RULES[player2_move].include?(player1_move)

		return "UNKNOWN RESULT"
	end

end