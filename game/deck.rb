require_relative "./cards/rank_card.rb" # WTF????

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
					deck.push(SetCard.new(card))
				when "count"
					deck.push(CountCard.new(card))
				when "rank"
					deck.push(RankCard.new(card)) # WTF? why do I need to require this but no other Card classes?!?!
				else
					deck.push(Card.new(card))
				end
			end
		end

		return deck.shuffle
	end
end