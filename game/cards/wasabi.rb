class Wasabi < Card
	@nigiri_points = 0

	def use_on_nigiri(nigiri_name)
		case nigiri_name.lowercase
		when "egg nigiri"
			@nigiri_points = 1
		when "salmon nigiri"
			@nigiri_points = 2
		when "squid nigiri"
			@nigiri_points = 3
		end
	end

	def calculate_points(plate)
		return @nigiri_points * 2
	end

	def is_used
		return @nigiri_points !== 0
	end
end