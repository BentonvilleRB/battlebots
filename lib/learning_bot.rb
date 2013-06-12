require_relative 'game'
require_relative 'game_bot'

# Learn Bot -- This bot remembers all moves by its opponents. It knows that players change their 
#              moves to moves they haven't done as much. Therefore the Learn bot is more likely 
#              to pick an inverse (opposite) move of the lesser picked moves. In the case of a tie 
#              in amounts the learn bot will do a random pick of the possible (opposite) moves.
#
#              Example. After 20 games Learn Bot's opponent has picked
#             
#              rock     5
#              paper    5
#              scissors 3
#              spock    3
#              lizard   6
#              {rock: 5, paper:5, scissors: 3, spock: 3, lizard: 6}
#              The least used is scissors and spock so the winning choice is the inverse picks which
#              could be: rock, spock, lizard, paper.

class LearningBot < GameBot

  attr_accessor :opponent_moves

  def initialize(name="LearningBot")
    super
    @opponent_moves = {}
    Game::RULES.keys.each {|k| @opponent_moves[k] = 0}
  end

  def move
    # choose the opponents least moved inverse
    least_chosen = get_least_chosen_moves

    # of the least_chosen, get all the possible winning moves
    possible_winning_moves = least_chosen.map {|c| winning_move(c)}.flatten.uniq

    # now choose a move
    possible_winning_moves.sample
  end

  # given a move, find a move that will defeat it
  def winning_move(move)
    Game::RULES.select {|k,v| v.include?(move) }.keys
  end

  def get_least_chosen_moves
    @opponent_moves.select {|k,v| v <= least_chosen_number}.keys
  end

  def least_chosen_number
    @opponent_moves.values.min
  end

  # {:player1=>:lizard, :player2=>:scissors, :winner=>"player2", :winning_move=>:scissors}
  def process_result(result)

    if result[:winner] == "player1" && result[:winning_move] == @previous_move
      ## this was our move!
      @opponent_moves[ result[:player2] ] += 1
    else
      @opponent_moves[ result[:player1] ] += 1
    end

  end

end

