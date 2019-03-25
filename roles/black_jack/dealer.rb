require_relative './player'

module BlackJack
  module Dealer
    include BlackJack::Player

    def deal_cards(deck, player)
      puts 'deal'
      player.cards << deck.take_cards(2)
    end

    def first_move
      false
    end
  end
end
