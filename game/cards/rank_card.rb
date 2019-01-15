require_relative "card"

class RankCard < Card

	def calculate_points(plate)
		@points[0]
		# amount_of_cards = plate.select{|card| card.name == @name}.length
		# return (amount_of_cards / @set).floor * @points
	end
end