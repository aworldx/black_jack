class BaseProcessor
  def initialize(game)
    @game = game
  end

  def move; end

  private

  attr_reader :game
end
