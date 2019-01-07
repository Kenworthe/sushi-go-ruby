class Deck

	attr_reader :cards

	file = File.read("cards.json")
	card_data = JSON.parse(file)
	@cards = card_data["cards"]

	def self.create_deck
		deck = []

		@cards.each do |card|
			card["amountInDeck"].times do 
				case card["type"]
				when "set"
					deck.push(Set_Card.new(card))
				when "count"
					deck.push(Count_Card.new(card))
				else
					deck.push(Card.new(card))
				end
			end
		end

		return deck.shuffle
	end
end