<<<<<<< HEAD
class Game

  def create_players(name)
    user = Player.new(name)
    diller = Player.new('Diller')
    interface = Interface.new
    start_game(user, diller, interface)
=======
<<<<<<< HEAD
require_relative 'cards.rb'
require_relative 'player.rb'
=======
require_relative "cards.rb"
require_relative "player.rb"
>>>>>>> 7c2003bb5e00539677e3b47854a3b507a57eb2a4

class Game
  def create_players
    puts 'What is your name?'
    name = gets.chomp.capitalize
    user = Player.new(name)
    diller = Player.new('Diller')
    start_game(user, diller)
>>>>>>> 1b07060c0c8f6f932830f1b70a8c284f2973354a
  end

  def menu(c, user, diller, interface)
    loop do
<<<<<<< HEAD
      interface.show_current_status(user, diller)
      break if check_cards_amount(user, diller, interface)
      interface.show_menu(user)
=======
      game_header(user, diller)
      break if check_cards_amount(user, diller)

      puts '1 - Skip a turn'
      puts '2 - Add card' if user.has_2_cards?
      puts '3 - Open cards'
>>>>>>> 1b07060c0c8f6f932830f1b70a8c284f2973354a
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

<<<<<<< HEAD
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
  end

=======
  def game_header(user, diller)
    puts "_____MC #{user.name}_____"
    puts "......_▒▒_\n.....@(•_•)@\n.....▁/(▒)/\n.......█'█\n.......╝'╚ "
    puts "#{user.cards} \n Your points: #{user.points}\nMoney: #{user.money}"
    puts '=======VC======='
    puts "_____MC #{diller.name}_____"
    puts "..... _██_\n....§(•,• )§\n....../▓▓\ \n.......╝╚ ♥ "
    puts '*' * diller.cards.size
  end

  def start_game(user, diller)
    c = Cards.new
    user.make_a_contribution
    diller.make_a_contribution
    2.times do
      user.take_card(c)
      diller.take_card(c)
    end
    menu(c, user, diller)
  end

  def check_cards_amount(user, diller)
    who_is_winner(user, diller) if !user.has_2_cards? && !diller.has_2_cards?
  end

>>>>>>> 1b07060c0c8f6f932830f1b70a8c284f2973354a
  def diller_step(diller, c)
    diller.take_card(c) if diller.points <= 17 && diller.has_2_cards?
  end

<<<<<<< HEAD
  def who_is_winner(user, diller, interface)
=======
  def who_is_winner(user, diller)
>>>>>>> 1b07060c0c8f6f932830f1b70a8c284f2973354a
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
<<<<<<< HEAD
    continue_game(user, diller, interface)
  end

  def continue_game(user, diller, interface)
    interface.continue_game_menu
=======
    continue_game(user, diller)
  end

  def continue_game(user, diller)
    puts 'Do U want to continue game?'
    puts '1 - Yes'
    puts '2 - No'
>>>>>>> 1b07060c0c8f6f932830f1b70a8c284f2973354a
    choose = gets.chomp.to_i
    if choose == 1
      user.prepare_for_new_game
      diller.prepare_for_new_game
<<<<<<< HEAD
      start_game(user, diller, interface) if user.money >= 10 && diller.money >= 10
    else
      interface.game_over
    end
  end
end
=======
      start_game(user, diller) if user.money >= 10 && diller.money >= 10
    else
      puts 'Game over'
    end
  end
end

game = Game.new
game.create_players
>>>>>>> 1b07060c0c8f6f932830f1b70a8c284f2973354a
