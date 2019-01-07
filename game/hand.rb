class hand

	def initialize
		@player
		@size = 0
		@cards = Array.new
	end

	def properties
		p self
	end

	def add(card)
		@cards.push(card)
	end

end