require_relative './base_participant'
require_relative '../input_services/terminal'

class Human < BaseParticipant
  attr_reader :input_service

  def initialize(params)
    super(params)

    @input_service = params[:input_service] || Terminal.new
  end

  def move(_game)
    selected_action = input_service.select(available_actions)
    selected_action
  end

  def call_name
    self.name = input_service.enter_value('Enter your name')
  end

  def show_cards
    cards.map(&:to_s).join(', ')
  end

  def check_points
    points
  end

  private

  attr_writer :name
end
