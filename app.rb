require 'tty-prompt'
require_relative "game/sushi_go.rb"

@prompt = TTY::Prompt.new

puts "Welcome to Sushi Go: Command Line Edition!\n"

def main_menu
	choice = @prompt.select("What do you want to do?", ["New Game", "Quit"])

	case choice
	when "New Game"
		puts "Great! Starting new game...\n"
		choose_players
	when "Quit"
		puts "Goodbye!"
		exit
	end
end

def choose_players
	max_players = 4
	min_players = 2
	options = [* min_players .. max_players].map(&:to_s) # Equivalent to: `arr.map {|a| a.to_s}`

	players = @prompt.select("How many players?", options).to_i

	sushi_go = Sushi_Go.new(players)
end

main_menu