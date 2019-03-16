require '../base_deck'
require '../card'

module BlackJack
  class Deck < BaseDeck

    private

    def generate
      suits.each do |suit|
        numbers.each do |number|
          cards << Card.new("#{number}#{suit}", number)
        end

        pictures.each do |pic|
          cards << Card.new("#{pic}#{suit}", pic == :T ? 11 : 10)
        end
      end
    end

    def suits
      %w(+ <3 ^ <>)
    end

    def numbers
      2..10
    end

    def pictures
      [:V, :D, :K, :T]
    end
  end
end