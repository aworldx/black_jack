class BaseRole
  attr_reader :abilities

  def initialize
    @abilities = []
  end

  def name
    :unknown
  end
end
