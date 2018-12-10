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
      break if game.check_cards_amount(user, dealer, bank)
      puts '1 - Skip a turn'
      puts '2 - Add card' if user.has_2_cards?
      puts '3 - Open cards'
      choose = gets.chomp.to_i
      game.menu(choose, deck, user, dealer, bank)
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
