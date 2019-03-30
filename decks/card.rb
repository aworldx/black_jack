class Card
  attr_reader :type, :suit, :digit, :sign, :state
  attr_accessor :points

  def initialize(type: :numerical, suit: '+', digit: nil, sign: nil)
    @type = type
    @suit = suit
    @digit = digit if type == :numerical
    @sign = sign if type == :picture
    @state = :closed
  end

  def to_s
    "#{type == :numerical ? digit : sign} #{suit}"
  end

  def opened?
    state == :opened
  end

  def open
    self.state = :opened
  end

  def closed?
    state == :closed
  end

  def close
    self.state = :closed
  end

  private

  attr_writer :state
end
