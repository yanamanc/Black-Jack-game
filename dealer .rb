class Dealer < Player
  def dealer_step(deck)
    if @points <= POINTS && has_2_cards?
      take_card(deck)
      1
    else
      2
    end
  end
end
