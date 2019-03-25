require './decks/black_jack/deck'
require './game/black_jack/game'
require './participants/human'
require './participants/computer'
require './roles/black_jack/dealer'
require './roles/black_jack/player'

the_deck = BlackJack::Deck.new

the_game = BlackJack::Game.new(the_deck)

player1 = Computer.new(name: 'Robot', role: BlackJack::Dealer, bank: 100)
the_game.add_player(player1)

player2 = Human.new(role: BlackJack::Player, bank: 100)
the_game.add_player(player2)

the_game.start