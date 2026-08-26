require 'set'
require 'pry-byebug'
require 'colorize'

require_relative 'lib/row'
require_relative 'lib/peg_display'
require_relative 'lib/helper'

def print_result_banner(result)
  if result
    puts 'Well done you won'
  else
    puts 'unlucky you lost'
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

class HumanCodebreaker
  def get_row_guess(guess)
    valid = false
    while !valid
      print "Row guess [#{guess}]> "
      input = gets.chomp
      begin
        row = Helper.create_row(input)
        return row
        rescue
          puts "Invalid input"
      end
    end
  end

  def recieve_feedback(feedback)
    return nil
  end
end

class HumanCodemaker
  def initialize
    @code = nil
  end

  def create_mastermind_row
    valid = false
    while !valid
      print "Choose mastermind code> "
      input = gets.chomp
      begin
        @code = Helper.create_mastermind_row(input)
        return @code
        rescue
          puts "Invalid input"
      end
    end
  end

  def return_mastermind_row
    return @code
  end
end

def game_loop(player1, player2 , max_guesses = 10)
  guesses = 0
  mastermind_row = player1.create_mastermind_row
  while guesses < max_guesses
    row = player2.get_row_guess(guesses+1)
    PegDisplay.show_pegs(row)
    result = Helper.compare_rows(mastermind_row, row)
    if result.size == 4 and result.all? { |val| val == 'white' }
      return true
    end
    player2.recieve_feedback(result)
    PegDisplay.display_feedback(result)
    guesses += 1
  end
  PegDisplay.show_pegs(mastermind_row)
  return false
end


#binding.pry
player1 = HumanCodemaker.new
player2 = HumanCodebreaker.new
res = game_loop(player1, player2)
print_result_banner(res)
