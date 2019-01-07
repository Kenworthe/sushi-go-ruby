class Card
	attr_reader :name

	def initialize(card_json)
		@name = card_json["name"]
		@type = card_json["type"]
		@set = card_json["set"]
		@count = card_json["count"]
		@points = card_json["points"]
		@description = card_json["description"]
	end

	def put_details
		p self
	end
end