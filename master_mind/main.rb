require 'set'

class Row

	include Enumerable

	def initialize(peg1, peg2, peg3, peg4)
		@row_list = [peg1, peg2, peg3, peg4]
		@row_set = Set.new(@row_list)
	end

	def each(&block)
		if block_given?
			@row_list.each(&block)
		else
			to_enum(:row_set)			
		end
	end

	def [](index)
		@row_list[index]
	end

	def contains?(peg)
		return @row_set.include?(peg)
	end



end

def compare_rows(original, guess)
	result = []
	(0...4).each do |i| 
		if original[i] == guess[i]
			result.push('white')
		elsif original.contains?(guess[i])
			result.push('black')
		end
	end
	result
end
=begin
def create_row(row)
	if not ( row.is_a?(String) or row.is_a?(Array) or row.is_a?(Integer) )
		raise ArgumentError, "Argument must be a String, Array or Integer"
	end

	if row.is_a?(Integer)
		row = row.digits.reverse
	elsif row.is_a?(String)
		p row
	end
end
=end

