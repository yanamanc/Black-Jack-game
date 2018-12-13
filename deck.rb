class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    set_deck
  end

  def set_deck
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank, nominal|
        card = Card.new(suit, rank, nominal)
        @cards << card
      end
    end
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
