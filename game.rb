class Game

  def create_players(name)
    user = Player.new(name)
    diller = Player.new('Diller')
    interface = Interface.new
    start_game(user, diller, interface)
  end

  def menu(c, user, diller, interface)
    loop do
      interface.show_current_status(user, diller)
      if check_cards_amount(user, diller, interface)
        break 
      else
      interface.show_menu(user)
    end
      choose = gets.chomp.to_i
      case choose
      when 1
        diller_step(diller, c)
      when 2
        user.take_card(c) if user.has_2_cards?
        diller_step(diller, c)
      when 3
        who_is_winner(user, diller, interface)
        break
      end
    end
  end

  private

  def start_game(user, diller, interface)
    c = Card.new
    user.make_a_contribution
    diller.make_a_contribution
    2.times do
      user.take_card(c)
      diller.take_card(c)
    end
    menu(c, user, diller, interface)
  end

  def check_cards_amount(user, diller, interface)
    who_is_winner(user, diller, interface) if !user.has_2_cards? && !diller.has_2_cards?
    return true if !user.has_2_cards? && !diller.has_2_cards?
  end

  def diller_step(diller, c)
    diller.take_card(c) if diller.points <= 17 && diller.has_2_cards?
  end

  def who_is_winner(user, diller, interface)
    user.points -= 10 if user.points > 21 && user.has_T?
    diller.points -= 10 if diller.points > 21 && diller.has_T?
    if user.points > diller.points && user.points <= 21
      puts "#{user.name} is winner!!!"
      user.money += 20
    elsif user.points < diller.points && diller.points <= 21
      puts "#{diller.name} is winner!!!"
      diller.money += 20
    else
      puts 'IT IS A DROW'
      diller.money += 10
      user.money += 10
    end
    continue_game(user, diller, interface)
  end

  def continue_game(user, diller, interface)
    interface.continue_game_menu
    choose = gets.chomp.to_i
    if choose == 1
      user.prepare_for_new_game
      diller.prepare_for_new_game
      start_game(user, diller, interface) if user.money >= 10 && diller.money >= 10
    else
      interface.game_over
    end
  end
end
