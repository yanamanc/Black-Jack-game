class Card
  attr_accessor :nominal
  $nominal = {}
  def initialize(card, v)
    @card = card
    $nominal[@card] = v
  end

end
