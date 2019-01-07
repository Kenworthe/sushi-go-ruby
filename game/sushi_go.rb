require_relative "player.rb"

class Sushi_Go

	def initialize(player_count)
		@player_count = player_count
		@players = []
		@conveyor_belt = Hash.new

		puts "Starting a #{@player_count}-player game!"
		
		@player_count.times do
			add_player
		end

		game_loop
	end

	def game_loop


	end

	def add_player
		name = "Player #{@players.size + 1}"
		@players.push(Player.new(name))
		puts "Created player: #{name}."
	end
end