require_relative '../base_game'
require_relative './processor'

module BlackJack
  class Game < BaseGame
    def initialize(deck, output_service = nil)
      super(deck, output_service, BlackJack::Processor.new(self))

      @bet_amount = 10.0
    end

    def game_can_be_continued?
      players.select { |pl| pl.bank >= bet_amount }.size >= 2
    end

    def round_can_be_continued?
      players_with_max_cards_count.size < players.size &&
        players_with_opened_cards.empty?
    end

    def get_winners
      max_points = players.map(&:check_points).select { |p| p <= 21 }.max
      players.select { |pl| pl.check_points == max_points }
    end

    private

    def player_points(player)
      player.send(:cards).reduce(0) do |sum, card|
        if card.sign == :T
          sum + 11 > 21 ? sum + 1 : sum + 11
        else
          sum + card.points
        end
      end
    end

    def max_cards_count
      3
    end
  end
end
