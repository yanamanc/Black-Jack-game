require_relative "cards.rb"
require_relative "player.rb"
require_relative "interface.rb"
require_relative "game.rb"

puts 'What is your name?'
name = gets.chomp.capitalize
game = Game.new
game.create_players(name)
