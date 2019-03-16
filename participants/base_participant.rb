class BaseParticipant
  attr_reader :name, :role, :bank

  def initialize(name, role, bank = 0.0)
    @name = name
    @role = role
    @bank = bank
  end

  def move(available_actions)
    raise "sorry, i can't move, i am just a viewer"
  end
end

