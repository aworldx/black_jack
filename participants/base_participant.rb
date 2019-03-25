class BaseParticipant
  attr_reader :name, :bank, :cards

  def initialize(params)
    @name = params[:name] || 'anonymous'
    @bank = params[:bank] || 0.0
    @cards = []

    self.extend(params[:role]) if params[:role]
  end

  def has_ability?(ability)
    self.respond_to?(ability)
  end

  private

  attr_writer :bank
end
