require './base_participant'

class Computer < BaseParticipant
  def move(available_actions)
    selected_actions = available_actions.sample
    selected_actions.execute
  end
end
