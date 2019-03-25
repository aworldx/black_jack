module BlackJack
  module Player
    def skip
      puts 'skip'
    end

    def take_card(deck)
      puts 'take'

      cards << deck.take_cards(1)
    end

    def open_cards
      puts 'open'

      puts cards
    end

    def make_bets(bet_amount)
      puts 'bets'
      self.bank -= bet_amount

      puts self.bank
    end

    def first_move
      true
    end

    def move
      puts 'move'
    end
  end
end
