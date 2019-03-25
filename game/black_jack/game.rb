require_relative '../base_game'
require_relative './processor'

module BlackJack
  class Game < BaseGame
    def initialize(deck, output_service = nil)
      super(deck, output_service, BlackJack::Processor.new(self))

      @bet_amount = 10.0
    end

    def can_be_continued?
      false
    end

    private

    def first_player
      players.select { |player| player.first_move }.first
    end
  end
end
