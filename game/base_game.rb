require 'byebug'
require_relative '../publishers/terminal'
require_relative './base_processor'

class BaseGame
  attr_reader :deck, :players, :bank, :bet_amount

  def initialize(deck, output_service = nil, game_processor = nil)
    @deck = deck
    @players = []
    @output_service = output_service || Terminal.new
    @processor = game_processor || BaseProcessor.new(self)
    @bank = 0.0
    @bet_amount = 0.0

    assign_points_to_cards
  end

  def greetings
    players.each do |player|
      next unless player.respond_to?(:call_name)

      player.call_name
      publish "Hello, #{player.name}"
    end
  end

  def add_player(new_player)
    raise "can't add player, maximum count reached" if players.size == max_players_count

    players << new_player
  end

  def start
    raise "can't start game without players" if players.empty?
    raise 'insufficient number of players' if players.count < min_players_count

    output_service.publish_for_all 'the game begins'
    self.current_player = first_player

    processor.move
  end

  def finish
    output_service.publish_for_all 'the game over'
  end

  def game_can_be_continued?
    false
  end

  def round_can_be_continued?
    false
  end

  def check_players_points
    players.each do |player|
      output_service.publish_for_person("your points: #{player.check_points}", player)
    end
  end

  def dealer
    players.select { |player| player.has_ability?(:deal_cards) }.first
  end

  def deal_cards(count, player = nil)
    return unless dealer

    publish 'Dealer deals cards...'

    if player
      dealer.deal_cards(deck, player, count)
      return
    end

    players.each do |pl|
      dealer.deal_cards(deck, pl, count)
    end
  end

  def show_players_cards(player = nil)
    if player
      publish "#{player.name} cards: #{player.show_cards}"
      return
    end

    players.each { |pl| publish "#{pl.name} cards: #{pl.show_cards}" }
  end

  def make_bets
    players.each do |player|
      next unless player.has_ability?(:make_bets)

      publish "#{player.name} makes a bet"
      self.bank += player.make_bets(bet_amount)
    end
  end

  def player_move
    players.each do |player|
      next unless player.has_ability?(:move)

      selected_action = player.move(self)
      publish "#{player.name}: #{selected_action} ..."
      send(selected_action, player)
    end
  end

  def publish_banks
    players.each { |pl| publish "#{pl.name}: #{pl.bank} in bank" }
  end

  def open_all_cards
    players.each(&:open_cards)
  end

  def move_bank(players)
    publish "!!! bank moves to winner: #{players.map(&:name).join(', ')}"

    players.each { |pl| pl.add_to_bank(bank.to_f / players.count) }
    self.bank = 0
  end

  def return_players_cards
    players.each do |pl|
      deck.cards.push(*pl.return_cards.each(&:close))
    end

    deck.shuffle
  end

  private

  attr_reader :output_service, :processor
  attr_writer :current_player, :bank

  def publish(text)
    output_service.publish_for_all text
  end

  def min_players_count
    2
  end

  def max_players_count
    2
  end

  def assign_points_to_cards
    deck.cards.each do |card|
      card.points = if card.type == :numerical
                      card.digit
                    else
                      { V: 10, D: 10, K: 10, T: 11 }.fetch(card.sign, 0)
                    end
    end
  end

  def skip(player); end

  def open_cards(player)
    player.open_cards
  end

  def take_card(player)
    deal_cards(1, player)
    show_players_cards(player)
  end

  def first_player
    players.select(&:first_move).first
  end

  def players_with_max_cards_count
    players.select { |pl| pl.cards_count >= max_cards_count }
  end

  def players_with_opened_cards
    players.select(&:opened_cards?)
  end
end
