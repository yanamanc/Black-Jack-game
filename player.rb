class Player
  attr_accessor :cards, :points, :name, :money
  POINTS = 17

  def initialize(name)
    @name = name
    @money = 100
    @cards = []
    @points = 0
  end

  def take_card(deck)
    card = deck.give_a_card
    @cards << card.rank + ' ' + card.suit
    @points += card.nominal
    deck.delete_card
    @points -= 10 if @points > 21 && has_T?
  end

  def make_a_contribution(bank)
    @money -= 10 if @money >= 10
    bank.balance += 10
  end

  def has_2_cards?
    cards.size == 2
  end

  def has_T?
    @cards.each { |card| return true if card =~ /^T/ }
  end

  def prepare_for_new_game
    @cards.clear
    @points = 0
  end
end
