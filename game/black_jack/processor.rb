require_relative '../base_processor'

module BlackJack
  class Processor < BaseProcessor
    def move
      game.greetings
      game.publish_banks

      loop do
        break unless game.game_can_be_continued?

        game.make_bets
        game.publish_banks

        game.deal_cards(2)
        game.show_players_cards

        loop do
          break unless game.round_can_be_continued?

          game.check_players_points
          game.player_move
        end

        game.open_all_cards
        game.show_players_cards
        game.check_players_points

        game.move_bank(game.get_winners)
        game.publish_banks
        game.return_players_cards
      end

      game.finish
    end
  end
end
