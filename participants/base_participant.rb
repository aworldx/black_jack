class BaseParticipant
  attr_reader :name, :role

  def initialize(name, role)
    @name = name
    @role = role
  end

  def move(available_actions)
    raise "sorry, i can't move, i am just a viewer"
  end
end
