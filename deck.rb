class Deck
  attr_reader :cards

  def initialize
    @cards = []

    generate
    shuffle
  end

  def shuffle
    cards.shuffle!
  end

  private

  def generate
    raise 'undefined deck type'
  end
end