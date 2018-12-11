class Deck
  attr_accessor :cards, :nominal

  def initialize
    @cards = []
    @nominal = {}
    set_deck
  end

  def set_deck
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank, nominal|
        card = rank + " " + suit
        c = Card.new(card)
        @cards << c
        @nominal[card] = nominal
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
    cards[0].card
  end

end
