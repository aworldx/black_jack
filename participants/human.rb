require './base_participant'
require '../input_services/terminal'

class Human < BaseParticipant
  def initialize(name, role, input_service = nil)
    super(name, role)

    @input_service = input_service || Terminal
  end

  def move(available_actions)
    selected_action = Terminal.select(available_actions)
    selected_action.execute
  end
end
