require_relative '../base_processor'

module BlackJack
  class Processor < BaseProcessor
    def move
      loop do
        break unless game.can_be_continued?
      end

      game.finish
    end
  end
end
