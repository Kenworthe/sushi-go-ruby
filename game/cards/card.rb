class Card
	attr_reader :name
	attr_reader :points

	def initialize(card_json)
		@name = card_json['name']
		@type = card_json['type']
		@set = card_json['set']
		@count = card_json['count']
		@points = card_json['points']
		@description = card_json['description']
		@icon = card_json['icon']
	end

	def put_details
		p self
	end

	def calculate_points(plate)
		@points
	end
end