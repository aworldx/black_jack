class Card
  attr_reader :title, :points

  def initialize(title, points)
    @title = title
    @points = points
  end

  def to_s
    "#{title}"
  end
end
