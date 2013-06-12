

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

class Game

  RULES = {scissors: [:paper, :lizard], 
           paper: [:rock, :spock], 
           rock: [:lizard, :scissors], 
           lizard: [:spock, :paper], 
           spock: [:scissors, :rock]}

  def self.play!(player1_move, player2_move)
    # validate both players move!
    raise "Invalid Move player1" unless RULES.keys.include?(player1_move)
    raise "Invalid Move player2" unless RULES.keys.include?(player2_move)

    result = {player1: player1_move, player2: player2_move, winner: "unknown"}

    result[:winner] = "TIE" if player1_move == player2_move

    result[:winner] = "player1" if RULES[player1_move].include?(player2_move)
    result[:winner] = "player2" if RULES[player2_move].include?(player1_move)

    if RULES[player1_move].include?(player2_move)
      result[:winner] = "player1" 
      result[:winning_move] = player1_move
    end
    if RULES[player2_move].include?(player1_move)
      result[:winner] = "player2" 
      result[:winning_move] = player2_move
    end

    result
  end

  def initialize(player1, player2)
    @player1 = player1  
    @player2 = player2  
  end

  def play
    result = self.class.play!(@player1.move, @player2.move)
    @player1.process_result(result)
    @player2.process_result(result)
    result
  end

end

