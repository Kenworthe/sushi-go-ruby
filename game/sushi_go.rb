require "json"
require 'tty-prompt'

require_relative "player.rb"
require_relative "cards/card.rb"
require_relative "cards/set_card.rb"
require_relative "cards/count_card.rb"
require_relative "deck.rb"

class SushiGo

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

		start_round
	end

	def start_round

		fill_conveyor_belt

		puts "Starting Round #{@round}!"

		while @conveyor_belt.values.all? {|arr| arr.length > 0} # Probably very inefficient... TODO: Find better way.

			@players.each do |current_player|
				player_turn(current_player)
			end

			rotate_players # Easier than rotating the @conveyor_belt's values. Has same effect in the end.
		end

		calculate_round_scores

		empty_all_plates

		@round += 1

		if @round > @max_rounds
			puts "Game is over! calculating final scores..."

			ranks = get_player_rankings
			puts "Final scores: #{ranks}."

			end_game
			# TODO: go back to main_menu
		else
			start_round
		end
	end

	def player_turn(current_player)
		puts "#{current_player.name}\'s turn!"
		puts "#{current_player.name}\'s plate has: #{current_player.plate.map{|e| e.name}.join(',')}"

		current_player_hand = @conveyor_belt[current_player.position]

		if current_player.is_human

			# TODO: add commands. What do? s"Inspect other player's plate", "Use Chopsticks", "Count Dessert"

			# TODO: break below out into #choose_card_prompt

			chosen_card_index = @prompt.select("Take your pick!") do |menu|
				current_player_hand.each do |card|
					menu.choice "#{card.name} \u{1F363}", current_player_hand.index(card)
				end
			end

			chosen_card = current_player_hand.delete_at(chosen_card_index)
			current_player.plate.push(chosen_card)

			puts "You chose: #{chosen_card.name}!"

		else
			# TODO: add AI logic to pick most value card.
			choice = current_player_hand.delete_at(0)
		end
	end

	def empty_all_plates
		@players.each do |player|
			player.plate = []
		end
	end

	def rotate_players
		@players.each do |player|
			if player.position == @players.length - 1
				player.position = 0
			else
				player.position += 1
			end
		end
		puts "The conveyor belt has rotated!"
	end

	def add_player
		position = @players.size
		name = "Player #{position + 1}"
		@players.push(Player.new(name, position))
		puts "#{name} has joined the game! (Seated at position #{position})"
	end

	def fill_conveyor_belt
		@players.each do |player|
			@conveyor_belt[player.position] = draw_card(5) # TODO: add logic to alter hand size per playercount
		end
	end

	def draw_card(num = 1)
		return @deck.pop(num)
	end

	def end_round

	end

	def calculate_round_scores
		round_score = 0

		@players.each do |player|
			player.plate.each do |card|
				round_score += card.calculate_points(player.plate)
			end
			player.score += round_score

			puts "#{player.name} round score is: #{round_score}. Total score is: #{player.score}"

		end
	end

	def end_game
		exit
	end

	def get_player_rankings
		return {} # PlayerName : score
	end
end