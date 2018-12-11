class Interface

  def start_game
    puts 'What is your name?'
    name = gets.chomp.capitalize
    deck = Deck.new
    user = Player.new(name)
    dealer = Dealer.new('Diller')
    interface = Interface.new
    game = Game.new
    bank = Bank.new
    deck.mix_deck
    game.start_game(bank, deck, user, dealer)
    interface.show_menu(game, deck, user, dealer, bank)
  end

  def show_menu(game, deck, user, dealer, bank)
    loop do
      show_current_status(user, dealer)
      if show_winner(game, user, dealer, bank)
        puts "#{dealer.name} cards: "
        puts dealer.cards
        break
      end
      puts '1 - Skip a turn'
      puts '2 - Add card' if user.has_2_cards?
      puts '3 - Open cards'
      choose = gets.chomp.to_i
      case choose
        when 1
          diller_step(dealer, deck)
        when 2
          user.take_card(deck) if user.has_2_cards?
          dealer.diller_step(deck)
        when 3
          puts "#{dealer.name} cards: "
          puts dealer.cards
          show_winner(game, user, dealer, bank)
      end
      break if choose == 3
    end
    continue_game_menu(bank, game, deck, user, dealer)
  end

  private

  def show_current_status(user, dealer)
    puts "_____MC #{user.name}_____"
    puts "......_▒▒_\n.....@(•_•)@\n.....▁/(▒)/\n.......█'█\n.......╝'╚ "
    puts "#{user.cards} \n Your points: #{user.points}\nMoney: #{user.money}"
    puts '=======VC======='
    puts "_____MC #{dealer.name}_____"
    puts "..... _██_\n....§(•,• )§\n....../▓▓\ \n.......╝╚ ♥ "
    puts '*' * dealer.cards.size
  end
  
  def show_winner(game, user, dealer, bank)
    winner = { 1 => "#{user.name} is winner!!!", 2 => "#{dealer.name} is winner!!!", 3 => "IT IS A DROW" }
    if game.check_cards_amount(user, dealer, bank)
      puts "#{winner[game.who_is_winner(user, dealer, bank)]}"
    end
    game.check_cards_amount(user, dealer, bank)
  end

  def continue_game_menu(bank, game, deck, user, dealer)
    puts 'Do U want to continue game?'
    puts '1 - Yes'
    puts '2 - No'
    choose = gets.chomp.to_i
    if choose == 1
      game.continue_game(bank, deck, user, dealer)
      show_menu(game, deck, user, dealer, bank)
    else
      game_over
    end
  end

  def game_over
    puts "_________________________\n|.......................|\n|.......GAME OVER.......|\n|.......................|\n|_______________________|"
  end

end
