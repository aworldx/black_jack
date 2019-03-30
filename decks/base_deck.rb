class BaseDeck
  attr_reader :cards

  def initialize
    @cards = []

    generate
    shuffle
  end

  def shuffle
    cards.shuffle!
  end

  def take_cards(count)
    cards.pop(count)
  end

  private

  def generate
    raise 'undefined deck type'
  end
end
