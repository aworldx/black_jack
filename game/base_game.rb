require_relative '../publishers/terminal'

class BaseGame
  attr_reader :players, :current_player

  def initialize(output_service = nil)
    @players = []
    @output_service = output_service || Terminal.new
  end

  def add_player(new_player)
    raise "can't add player, maximum count reached" if players.size == max_players_count

    players << new_player
  end

  def start
    raise "can't start game without players" if players.empty?
    raise 'insufficient number of players' if players.count < min_players_count

    output_service.publish_for_all 'the game begins'
    self.current_player = players[0]
  end

  def end
    output_service.publish_for_all 'the game over'
  end

  private

  attr_reader :output_service
  attr_writer :current_player

  def min_players_count
    2
  end

  def max_players_count
    2
  end
end
