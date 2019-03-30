require_relative '../base_deck'
require_relative '../card'

module BlackJack
  class Deck < BaseDeck
    private

    def generate
      suits.each do |suit|
        digits.each do |digit|
          cards << Card.new(type: :numerical, suit: suit, digit: digit)
        end

        pictures.each do |pic|
          cards << Card.new(type: :picture, suit: suit, sign: pic)
        end
      end
    end

    def suits
      %w[+ <3 ^ <>]
    end

    def digits
      2..10
    end

    def pictures
      %i[V D K T]
    end
  end
end
