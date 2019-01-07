require 'tty-prompt'
require_relative "./game/sushi_go.rb"

@prompt = TTY::Prompt.new

puts "Welcome to Sushi Go: Command Line Edition!\n"

def main_menu
	choice = @prompt.select("Please select game mode: ", ["Single Player", "Multiplayer", "Quit"])

	case choice
	when "Single Player"
		puts "Great! Starting new game...\n\n"
		choose_players
	when "Multiplayer"
		puts "Whoops. Multiplayer isn't implemented yet!\n\n"
		main_menu
	when "Quit"
		puts "Goodbye!"
		exit
	end
end

def choose_players
	max_players = 5
	min_players = 2
	options = [* min_players .. max_players].map(&:to_s) # Equivalent to: `arr.map {|a| a.to_s}`

	players = @prompt.select("How many players?", options).to_i
	puts "Starting a #{players}-player game..."

	sushi_go = Sushi_Go.new(players)
end

main_menu