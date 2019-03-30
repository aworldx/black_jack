module BlackJack
  module Player
    def make_bets(bet_amount)
      self.bank -= bet_amount
      bet_amount
    end

    def first_move
      true
    end

    def available_actions
      actions = %i[skip open_cards]
      actions << :take_card if cards.size == 2
      actions
    end
  end
end
