class Interface

  def show_current_status(user, dealer)
    puts "_____MC #{user.name}_____"
    puts "......_▒▒_\n.....@(•_•)@\n.....▁/(▒)/\n.......█'█\n.......╝'╚ "
    puts "#{user.cards} \n Your points: #{user.points}\nMoney: #{user.money}"
    puts '=======VC======='
    puts "_____MC #{dealer.name}_____"
    puts "..... _██_\n....§(•,• )§\n....../▓▓\ \n.......╝╚ ♥ "
    puts '*' * dealer.cards.size
  end

  def show_menu(game, deck, c, user, dealer, bank)
    loop do
      show_current_status(user, dealer)
      break if game.check_cards_amount(user, dealer, bank)
      puts '1 - Skip a turn'
      puts '2 - Add card' if user.has_2_cards?
      puts '3 - Open cards'
      choose = gets.chomp.to_i
      game.menu(choose, deck, c, user, dealer, bank)
      break if choose == 3
    end
    continue_game_menu(bank, game, c, deck, user, dealer)
  end

  def continue_game_menu(bank, game, c, deck, user, dealer)
    puts 'Do U want to continue game?'
    puts '1 - Yes'
    puts '2 - No'
    choose = gets.chomp.to_i
    if choose == 1
      game.continue_game(bank, c, deck, user, dealer)
      show_menu(game, deck, c, user, dealer, bank)
    else
      game_over
    end
  end

  def game_over
    puts "_________________________\n|.......................|\n|.......GAME OVER.......|\n|.......................|\n|_______________________|"
  end

end
