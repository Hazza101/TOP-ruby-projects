module Helper
	def self.compare_rows(original, guess)
		result = []
		remainding = []
		(0...4).each do |i|
			if original[i] == guess[i]
				result.push('white')
			else
				remainding.push(original[i])
			end
		end
		guess.uniq.each do |peg|
			if remainding.include?(peg)
				result.push('black')
			end
		end

		result
	end

	def self.create_row(row)
		if not ( row.is_a?(String) or row.is_a?(Array) or row.is_a?(Integer) )
			raise ArgumentError, "Argument must be a String, Array or Integer"
		end

		if row.is_a?(Integer)
			row = row.digits.reverse
		elsif row.is_a?(String)
			if not row.match(/^\d+$/)
				raise ArgumentError, "String Argument must only contain digits"
			end
			row = Integer(row).digits.reverse
		end
		if row.size != 4
			raise ArgumentError, "There must be 4 digits"
		end
		row_object = Row.new(*row)
	end

	def self.create_mastermind_row(row)
		if not ( row.is_a?(String) or row.is_a?(Array) or row.is_a?(Integer) )
			raise ArgumentError, "Argument must be a String, Array or Integer"
		end

		if row.is_a?(Integer)
			row = row.digits.reverse
		elsif row.is_a?(String)
			if not row.match(/^\d+$/)
				raise ArgumentError, "String Argument must only contain digits"
			end
			row = Integer(row).digits.reverse
		end
		if row.size != 4
			raise ArgumentError, "There must be 4 digits"
		end
		if row.uniq.size != 4
			raise ArgumentError, "The 4 digits must be unique"
		end
		row_object = Row.new(*row)
	end
end
