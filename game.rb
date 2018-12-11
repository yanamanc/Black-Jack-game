class Game

  def create_data
    puts 'What is your name?'
    name = gets.chomp.capitalize
    deck = Deck.new
    user = Player.new(name)
    dealer = Dealer.new('Diller')
    interface = Interface.new
    bank = Bank.new
    deck.mix_deck
    start_game(bank, deck, user, dealer)
    interface.show_menu(self, deck, user, dealer, bank)
  end

  def start_game(bank, deck, user, dealer)
    user.make_a_contribution(bank)
    dealer.make_a_contribution(bank)
    2.times do
      user.take_card(deck)
      dealer.take_card(deck)
    end
  end

  def check_cards_amount(user, dealer, bank)
    !user.has_2_cards? && !dealer.has_2_cards?
  end

  def who_is_winner(user, dealer, bank)
    user.points -= 10 if user.points > 21 && user.has_T?
    dealer.points -= 10 if dealer.points > 21 && dealer.has_T?
    if user_win(user, dealer)
      user.money += bank.balance
      1
    elsif 
      dealer_win(user, dealer)
      dealer.money += bank.balance
      2
    else
      dealer.money += bank.balance / 2
      user.money += bank.balance / 2
      3
    end
  end

  def continue_game(bank, deck, user, dealer)
    user.prepare_for_new_game
    dealer.prepare_for_new_game
    start_game(bank, deck, user, dealer) if user.money >= 10 && dealer.money >= 10
  end

  private

  def user_win(user, dealer)
    user.points > dealer.points && user.points <= 21
  end

  def dealer_win(user, dealer)
    user.points < dealer.points && dealer.points <= 21
  end

end
