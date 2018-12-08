class Player
  attr_accessor :cards, :points, :name, :money

  def initialize(name)
    @name = name
    @money = 100
    @cards = []
    @points = 0
  end

  def take_card(card)
    index = card.give_a_card
    @cards << card.cards[index]
    @points += card.deck[@cards.last]
    card.delete_card(index)
  end

  def make_a_contribution
    @money -= 10 if @money >= 10
  end

  def has_2_cards?
    cards.size == 2
  end

  def has_T?
    cards.each { |x| x =~ /^T/ }
  end

  def prepare_for_new_game
    @cards.clear
    @points = 0
  end

  def prepare_for_new_game
    @cards.clear
    @points = 0
  end
end
