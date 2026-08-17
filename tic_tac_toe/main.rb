require_relative 'lib/board'

module Printing
	def self.display_board(board)
		m = board.size	
		n = board[0].size
		(0...m).each do |i|
			(0...n).each do |j|
				val = board[i][j]
				print "#{val} "
			end
			print "\n"
		end
	end
end

board = Board.new

Printing.display_board(board.board)

