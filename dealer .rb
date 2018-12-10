class Dealer < Player
  def diller_step(deck, c)
    take_card(deck, c) if @points <= 17 && has_2_cards?
  end
end
