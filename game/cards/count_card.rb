require_relative "card"

class Count_Card < Card

	def get_count(plate)
		return plate.select{|card| card.name === @name}.length
	end

	def calculate_points(plate)
		case @name
		when "Dumpling" # TODO: Break these out into their own classes, with their own calculate_pts
			return 0
		when "1 Maki"
			return 0
		end
	end
end