require_relative '../base_processor'

module BlackJack
  class Processor < BaseProcessor
    def move
      greetings

      loop do
        # break unless game.can_be_continued?

        deal_cards
        make_bets

        player_move

        break unless game.can_be_continued?
      end

      game.finish
    end

    private

    def greetings
      game.players.each do |player|
        next unless player.respond_to?(:call_name)

        player.call_name
        puts "Hello, #{player.name}"
      end
    end

    def deal_cards
      current_dealer = game.players.select { |player| player.has_ability?(:deal_cards) }.first
      return unless current_dealer

      game.players.each do |player|
        current_dealer.deal_cards(game.deck, player)

        puts player.cards
      end
    end

    def make_bets
      game.players.each do |player|
        next unless player.has_ability?(:make_bets)

        player.make_bets(game.bet_amount)
      end
    end

    def player_move
      game.players.each do |player|
        next unless player.has_ability?(:move)

        player.move
      end
    end
  end
end
