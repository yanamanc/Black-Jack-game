class Game

  def menu(choose, deck, user, dealer, bank)
      case choose
      when 1
        diller_step(dealer, deck)
      when 2
        user.take_card(deck) if user.has_2_cards?
        dealer.diller_step(deck)
      when 3
        who_is_winner(user, dealer, bank)
      end
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
    who_is_winner(user, dealer, bank) if !user.has_2_cards? && !dealer.has_2_cards?
    !user.has_2_cards? && !dealer.has_2_cards?
  end

  def who_is_winner(user, dealer, bank)
    puts "#{dealer.name} cards: "
    puts dealer.cards
    user.points -= 10 if user.points > 21 && user.has_T?
    dealer.points -= 10 if dealer.points > 21 && dealer.has_T?
    if user.points > dealer.points && user.points <= 21
      puts "#{user.name} is winner!!!"
      user.money += bank.balance
    elsif user.points < dealer.points && dealer.points <= 21
      puts "#{dealer.name} is winner!!!"
      dealer.money += bank.balance
    else
      puts 'IT IS A DROW'
      dealer.money += bank.balance / 2
      user.money += bank.balance / 2
    end
  end

  def continue_game(bank, deck, user, dealer)
    user.prepare_for_new_game
    dealer.prepare_for_new_game
    start_game(bank, deck, user, dealer) if user.money >= 10 && dealer.money >= 10
  end
end
