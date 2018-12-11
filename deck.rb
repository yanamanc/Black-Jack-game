class Deck
  attr_accessor :cards, :nominal

  def initialize
    @cards = []
    @nominal = {}
    set_deck
  end

  def set_deck
    ranks = {
      "2" => 2,"3" => 3, "4" => 4, "5" => 5, "6" => 6,
      "7" => 7, "8" => 8, "9" => 9, "10" => 10,
      "V" => 10, "D" => 10, "K" => 10, "T" => 11
    }
    Card::SUITS.each do |x|
    ranks.each do |k, v|
      card = k + " " + x
      c = Card.new(card)
      @cards << c
      @nominal[card] = v
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
