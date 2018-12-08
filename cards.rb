class Card
  attr_accessor :deck, :cards
  def initialize
    @cards = []
    @deck = Hash.new { |card, nominal| }
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
        @deck[card] = v
        @cards << card
      end
    end
  end

  def give_a_card
    return card = rand(0..@cards.size - 1)
  end

  def delete_card(card)
    @deck.delete(@cards[card])
    @cards.delete_at(card)
  end
end
