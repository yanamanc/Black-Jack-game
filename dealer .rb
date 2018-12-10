class Dealer < Player
  def diller_step(deck)
    take_card(deck) if @points <= 17 && has_2_cards?
  end
end
