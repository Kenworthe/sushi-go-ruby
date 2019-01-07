class Player

	def initialize(name = nil)

		def get_random_name
			return Random.rand(1000...9999).to_s
		end

		@position
		@name = name === nil ? get_random_name : name
		@score = 0
		@plate = []
	end

	def print_self
		p self
	end

	def add_to_plate(card)
		@plate.push(card)
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