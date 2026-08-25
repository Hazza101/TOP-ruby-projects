require 'set'
require 'pry-byebug'
require 'colorize'

require_relative 'lib/row'
require_relative 'lib/peg_display'

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
	guess.uniq.each do |peg|
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

def get_row_from_user(guess)
	valid = false
	while !valid
		print "Row guess [#{guess}]> "
		input = gets.chomp
		begin
			row = create_row(input)
			return row
			rescue
				puts "Invalid input"
		end
	end
end


def print_result_banner(result)
	if result
		puts "Well done you won"
	else
		puts "unlucky you lost"
	end
end


class RobotCodemaker
	def initialize
		@code = nil
	end

	def create_mastermind_row
		array = (1..6).to_a.shuffle.take(4)
		@code = Row.new(*array)
		return @code
	end

	def return_mastermind_row
		@code
	end
end

def game_loop(player1, player2 = nil, max_guesses = 10)
	guesses = 0
	mastermind_row = player1.create_mastermind_row
	while guesses < max_guesses
		row = get_row_from_user(guesses+1)
		PegDisplay.show_pegs(row)
		result = compare_rows(mastermind_row, row)
		if result.size == 4 and result.all? { |val| val == 'white' }
			return true
		end
		PegDisplay.display_feedback(result)
		guesses += 1
	end
	PegDisplay.show_pegs(mastermind_row)
	return false
end


#binding.pry
player1 = RobotCodemaker.new
res = game_loop(player1)
print_result_banner(res)





