require_relative "card"

class SetCard < Card

	def calculate_points(plate)
		@points
		# amount_of_cards = plate.select{|card| card.name == @name}.length
		# return (amount_of_cards / @set).floor * @points
	end
end