require "json"
require 'tty-prompt'

require_relative "player.rb"
require_relative "cards/card.rb"
require_relative "cards/set_card.rb"
require_relative "cards/count_card.rb"
require_relative "deck.rb"

class Sushi_Go

	def initialize(player_count)
		@player_count = player_count
		@players = []
		@conveyor_belt = {}
		@round = 1
		@max_rounds = 3
		@deck = Deck.create_deck
		@prompt = TTY::Prompt.new
		
		@player_count.times do
			add_player
		end
		
		@players.each do |player|
			@conveyor_belt[player.get_position] = draw_card(5) # TODO: add logic to alter hand size per playercount
		end

		start_round
	end

	def start_round

		# TODO: check if conveyor belt is empty. if empty, end round.

		if @round > @max_rounds
			puts "Game is over! calculating final scores..."

			ranks = get_player_rankings
			puts "Final scores: #{ranks}."

			end_game
			# TODO: go back to main_menu
		end

		puts "Starting Round #{@round}!"

		@players.each do |current_player|
			current_player_hand = @conveyor_belt[current_player.position]

			if current_player.is_human

				chosen_card = @prompt.select("Pick a card!") do |menu|
					current_player_hand.each do |card|
						menu.choice card.name, card
					end
				end

				current_player.plate.push(chosen_card)

				puts "You chose: #{chosen_card.put_details}"
				puts "Your plate now contains: #{current_player.plate}"

			else
				# TODO: add AI logic to pick most value card.
				choice = current_player_hand[0]
			end
		end

		# TODO: rotate player positions.

		@round += 1

		start_round
	end

	def add_player
		position = @players.size
		name = "Player #{position + 1}"
		@players.push(Player.new(name, position))
		puts "#{name} has joined the game! (Seated at position #{position})"
	end

	def draw_card(num = 1)
		return @deck.pop(num)
	end

	def end_round

	end

	def calculate_round_scores
	end

	def end_game
		exit
	end

	def get_player_rankings
		return {} # PlayerName : score
	end
end