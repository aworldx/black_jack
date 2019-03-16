require_relative '../base_game'
require_relative './processor'

module BlackJack
  class Game < BaseGame
    def initialize(output_service = nil)
      super(output_service, BlackJack::Processor.new(self))
    end

    def can_be_continued?
      false
    end

    private

    def first_player
      players.select { |player| player.role.name == :player }.first
    end
  end
end
