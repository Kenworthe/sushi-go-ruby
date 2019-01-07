require "json"
require_relative "player.rb"

class Sushi_Go

	def initialize(player_count)
		@player_count = player_count
		@players = []
		@conveyor_belt = {}
		@round = 1
		@max_rounds = 3

		puts "Creating a #{@player_count}-player game!"
		
		@player_count.times do
			add_player
		end

		# create deck / shuffle

		# create conveyor belt

		# start game loop
		game_loop
	end

	def game_loop
		# check if conveyor belt is empty. if empty, end round, calculate scores.
			# if round 3 (max), then end game.

		# print conveyor belt at player position

		# prompt player to pick a card

		# add picked card to player plate

		# 

	end

	def add_player
		name = "Player #{@players.size + 1}"
		@players.push(Player.new(name))
		puts "Created player: #{name}."
	end

	def create_deck
		file = File.read("../cards.json")
		card_info = JSON.parse(file)
	end

	def shuffle_deck
	end

	def draw_card
	end

	
end