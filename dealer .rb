class Dealer < Player
  def dealer_step(deck)
    take_card(deck) if @points <= POINTS_17 && has_2_cards?
  end
end
