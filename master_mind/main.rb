# frozen_string_literal: true

require 'set'
require 'pry-byebug'
require 'colorize'

require_relative 'lib/row'
require_relative 'lib/peg_display'
require_relative 'lib/helper'
require_relative 'lib/players/humanCodemaker'
require_relative 'lib/players/humanCodebreaker'
require_relative 'lib/players/robotCodemaker'

def print_result_banner(result)
  if result
    puts 'Well done you won'
  else
    puts 'unlucky you lost'
  end
end

def game_loop(player1, player2, max_guesses = 10)
  guesses = 0
  mastermind_row = player1.create_mastermind_row
  while guesses < max_guesses
    row = player2.get_row_guess(guesses + 1)
    PegDisplay.show_pegs(row)
    result = Helper.compare_rows(mastermind_row, row)
    return true if result.size == 4 && result.all? { |val| val == 'white' }

    player2.recieve_feedback(result)
    PegDisplay.display_feedback(result)
    guesses += 1
  end
  PegDisplay.show_pegs(mastermind_row)
  false
end

# binding.pry
player1 = RobotCodemaker.new
player2 = HumanCodebreaker.new
res = game_loop(player1, player2)
print_result_banner(res)
