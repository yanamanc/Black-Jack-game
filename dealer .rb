class Dealer < Player
  def dealer_step(deck)
    if @points <= POINTS && has_2_cards?
      take_card(deck)
      puts "#{self.name} took the card"
    else
      puts "#{self.name} skip the turn"
    end
  end
end
