class Card
  attr_accessor :card
  SUITS = ["✣", "❤", "♦", "♠"]
  RANKS = {
      "2" => 2,"3" => 3, "4" => 4, "5" => 5, "6" => 6,
      "7" => 7, "8" => 8, "9" => 9, "10" => 10,
      "V" => 10, "D" => 10, "K" => 10, "T" => 11
    }
  def initialize(card)
    @card = card
  end

end
