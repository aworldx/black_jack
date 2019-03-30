module Strategy
  module BlackJack
    def select_action(player)
      return :skip if player.points >= 17

      :open_cards
    end
  end
end
