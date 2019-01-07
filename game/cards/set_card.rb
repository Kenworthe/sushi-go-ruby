require_relative "card"

class Set_Card < Card

	def calculate_points(plate)
		amount_of_cards = plate.select{|card| card.name === @name}.length
		return (amount_of_cards / @set).floor * @points
	end
end