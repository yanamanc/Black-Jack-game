class Card
  attr_accessor :nominal
  def initialize
    @nominal = {}
  end

  def set_deck(deck)
    ranks = {
      "2" => 2,"3" => 3, "4" => 4, "5" => 5, "6" => 6,
      "7" => 7, "8" => 8, "9" => 9, "10" => 10,
      "V" => 10, "D" => 10, "K" => 10, "T" => 11
    }
    ["✣", "❤", "♦", "♠"].each do |x|
      ranks.each do |k, v|
        card = k + " " + x
        @nominal[card] = v
        deck.cards << card
      end
    end
  end
end
