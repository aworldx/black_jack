class BaseProcessor
  def initialize(game)
    @game = game
  end

  def move
    game.finish
  end

  private

  attr_reader :game
end
