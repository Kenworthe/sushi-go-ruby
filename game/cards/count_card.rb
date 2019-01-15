require_relative "card"

class CountCard < Card

	def get_count(plate)
		return plate.select{|card| card.name == @name}.length
	end

	def calculate_points(plate)
		@points[0]
	end
end