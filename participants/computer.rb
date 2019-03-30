require_relative './base_participant'

class Computer < BaseParticipant
  def initialize(params)
    super(params)

    extend(params[:strategy]) if params[:strategy]
  end

  def move(_game)
    select_action(self)
  end
end
