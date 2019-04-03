class PlateCalculator

	def self.calculate_score(plate)
		card_counts = get_card_counts(plate)

		
	end

	private
	def get_card_counts(plate)
		card_counts = {}

		plate.each do |card|
			if card_counts[card.name] = nil
				card_counts[card.name] = 1
			else
				card_counts[card.name] += 1
			end
		end

		card_counts
	end
end