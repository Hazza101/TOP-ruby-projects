require 'set'
require 'pry-byebug'

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
	remainding = []
	(0...4).each do |i| 
		if original[i] == guess[i]
			result.push('white')
		else
			remainding.push(original[i])
		end
	end
	guess.each do |peg|
		if remainding.include?(peg)
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
			return row
			rescue
				puts "Invalid input"
		end
	end
end

def create_mastermind_row
	array = (1..6).to_a.shuffle.take(4)
	Row.new(*array)
end

def print_result_banner(result)
	if result
		puts "Well done you won"
	else
		puts "unlucky you lost"
	end
end

def game_loop(max_guesses = 10)
	guesses = 0
	mastermind_row = create_mastermind_row
	while guesses < max_guesses
		p mastermind_row
		row = get_row_from_user
		result = compare_rows(mastermind_row, row)
		if result.size == 4 and result.all? { |val| val == 'white' }
			return true
		end
		p result
		guesses += 1
	end
	return false
end


#binding.pry
res = game_loop
print_result_banner(res)



