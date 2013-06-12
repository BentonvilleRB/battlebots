require './lib/game'
require './lib/game_bot'
require './lib/stubborn_bot'
require './lib/chaos_bot'
require './lib/learning_bot'

def process(result)
  case result[:winner]
  when "player1"
    @score[:player1][:wins] += 1
  when "player2"
    @score[:player2][:wins] += 1
  else
    @score[:ties] += 1
  end
end


bot1 = ChaosBot.new
bot2 = ChaosBot.new("Mr.SmartyPants")
@game = Game.new(bot1, bot2)
@score = {player1: {wins: 0, name: bot1.name}, player2: {wins: 0, name: bot2.name}, ties: 0}

1000.times { process @game.play }

puts @score

