require './game/black_jack/game'
require './participants/human'
require './participants/computer'
require './roles/black_jack/dealer'
require './roles/black_jack/player'

the_game = BlackJack::Game.new

player1 = Computer.new('Robot', BlackJack::Dealer, 100)
the_game.add_player(player1)

player2 = Human.new('Max Pain', BlackJack::Player, nil,100)
the_game.add_player(player2)

the_game.start