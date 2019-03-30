require 'byebug'
class BaseParticipant
  attr_reader :name, :bank

  def initialize(params)
    @name = params[:name] || 'anonymous'
    @bank = params[:bank] || 0.0
    @cards = []

    extend(params[:role]) if params[:role]
  end

  def has_ability?(ability)
    respond_to?(ability)
  end

  def push_card(cards)
    self.cards.push(*cards)
  end

  def return_cards
    cards.pop(cards_count)
  end

  def show_cards
    cards.map { |card| card.opened? ? card.to_s : '***' }.join(', ')
  end

  def cards_count
    cards.size
  end

  def check_points
    opened_cards? ? points : '***'
  end

  def opened_cards?
    !cards.select(&:opened?).empty?
  end

  def open_cards
    cards.each(&:open)
  end

  def add_to_bank(amount)
    self.bank += amount
  end

  protected

  def points
    cards.sum(&:points)
  end

  attr_accessor :cards

  private

  attr_writer :bank
end
