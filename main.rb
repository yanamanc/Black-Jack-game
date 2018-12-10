require_relative "deck.rb"
require_relative "bank.rb"
require_relative "cards.rb"
require_relative "player.rb"
require_relative "dealer .rb"
require_relative "interface.rb"
require_relative "game.rb"

puts 'What is your name?'
name = gets.chomp.capitalize
deck = Deck.new
user = Player.new(name)
dealer = Dealer.new('Diller')
interface = Interface.new
game = Game.new
bank = Bank.new
c = Card.new
c.set_deck(deck)
deck.mix_deck
game.start_game(bank, c, deck, user, dealer)
interface.show_menu(game, deck, c, user, dealer, bank)
