require 'set'

class Row

	include Enumerable

	def initialize(peg1, peg2, peg3, peg4)
		white_list = [1,2,3,4,5,6]
		if !white_list.include?(peg1) or !white_list.include?(peg2) or !white_list.include?(peg3) or !white_list.include?(peg4)
			raise ArgumentException, "Number must 1, 2, 3, 4, 5, 6"
		end
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

def create_row(row)
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

def get_row_from_user
	valid = false
	while !valid
		print "Row guess> "
		input = gets.chomp
		begin
			row = create_row(input)
			valid = true
			rescue
				puts "Invalid input"
		end
	end
end

get_row_from_user
