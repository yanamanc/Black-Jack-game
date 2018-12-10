class Deck
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def delete_card
    @cards.delete_at(0)
  end

  def mix_deck
    @cards.shuffle!
  end

  def give_a_card
    cards[0]
  end

end
