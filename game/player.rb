class Player
	attr_accessor :position
	attr_accessor :plate
	attr_accessor :score
	attr_reader :name
	attr_reader :is_human

	def initialize(name, position, is_human = true)
		@name = name
		@position = position
		@score = 0
		@plate = []
		@pudding = []
		@is_human = is_human
	end

	def print_self
		p self
	end

	def take_card(card)
		if card.name == "Pudding"
			@pudding.push(card)
		else
			@plate.push(card)
		end
	end

	def calculate_plate
		total = 0

		# TODO: Add logic to calculate card points here.

		return total
	end

	def clear_plate
		@plate = []
	end
end