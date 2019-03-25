require_relative './base_participant'
require_relative '../input_services/terminal'

class Human < BaseParticipant
  attr_reader :input_service

  def initialize(params)
    super(params)

    @input_service = params[:input_service] || Terminal.new
  end

  def move(available_actions)
    selected_action = Terminal.select(available_actions)
    selected_action.execute
  end

  def call_name
    self.name = input_service.enter_value('Enter your name')
  end

  private

  attr_writer :name
end
