require_relative 'lib/board'
require_relative 'lib/printing'
require_relative 'lib/players'

board = Board.new
while true
	Printing.display_board(board.board)
	i, j = Printing.prompt_until_correct
	is_valid_move = board.make_move(i, j)
	if not is_valid_move
		puts "Please make a valid move"
		next
	end
  res = board.check_winner?
	puts "result: #{res}"
end

