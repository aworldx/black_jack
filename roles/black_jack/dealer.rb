require_relative './player'

module BlackJack
  module Dealer
    include BlackJack::Player

    def deal_cards(deck, player, count)
      player.push_card(deck.take_cards(count))
    end

    def first_move
      false
    end

    def available_actions
      actions = [:skip]
      actions.push(:take_card) if cards.size == 2
      actions
    end
  end
end
