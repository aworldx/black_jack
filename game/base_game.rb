require_relative '../publishers/terminal'
require_relative './base_processor'

class BaseGame
  attr_reader :players, :current_player, :bank

  def initialize(output_service = nil, game_processor = nil)
    @players = []
    @output_service = output_service || Terminal.new
    @processor = game_processor || BaseProcessor.new(self)
    @bank = 0.0
  end

  def add_player(new_player)
    raise "can't add player, maximum count reached" if players.size == max_players_count

    players << new_player
  end

  def start
    raise "can't start game without players" if players.empty?
    raise 'insufficient number of players' if players.count < min_players_count

    output_service.publish_for_all 'the game begins'
    self.current_player = first_player

    processor.move
  end

  def finish
    output_service.publish_for_all 'the game over'
  end

  def can_be_continued?
    false
  end

  private

  attr_reader :output_service, :processor
  attr_writer :current_player

  def min_players_count
    2
  end

  def max_players_count
    2
  end

  def first_player
    player[0]
  end
end
