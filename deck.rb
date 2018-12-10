class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    set_deck
  end

  def set_deck
    ranks = {
      "2" => 2,"3" => 3, "4" => 4, "5" => 5, "6" => 6,
      "7" => 7, "8" => 8, "9" => 9, "10" => 10,
      "V" => 10, "D" => 10, "K" => 10, "T" => 11
    }
    ["✣", "❤", "♦", "♠"].each do |x|
    ranks.each do |k, v|
      card = k + " " + x
      c = Card.new(card, v)
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
