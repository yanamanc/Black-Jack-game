class Interface

  def show_current_status(user, diller)
    puts "_____MC #{user.name}_____"
    puts "......_▒▒_\n.....@(•_•)@\n.....▁/(▒)/\n.......█'█\n.......╝'╚ "
    puts "#{user.cards} \n Your points: #{user.points}\nMoney: #{user.money}"
    puts '=======VC======='
    puts "_____MC #{diller.name}_____"
    puts "..... _██_\n....§(•,• )§\n....../▓▓\ \n.......╝╚ ♥ "
    puts '*' * diller.cards.size
	end

	def show_menu(user)
	  puts '1 - Skip a turn'
      puts '2 - Add card' if user.has_2_cards?
      puts '3 - Open cards'
	end

	def continue_game_menu
	puts 'Do U want to continue game?'
    puts '1 - Yes'
    puts '2 - No'
	end

  def game_over
    puts "_________________________\n|.......................|\n|.......GAME OVER.......|\n|.......................|\n|_______________________|"
  end

end
