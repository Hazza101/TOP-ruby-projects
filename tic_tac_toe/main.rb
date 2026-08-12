
class Board
	attr_reader :board
	
	PLAYER_ONE = 1
	PLAYER_TWO = 2

	def initialize
		@board = Array.new(3) { Array.new(3, 0) }
		@turn = PLAYER_ONE
	end

	def make_move(i, j)
		if !i.between?(0, 2) or !j.between?(0,2)
			return false
		end

		if board[i][j] != 0
			return false
		end

		board[i][j] = @turn
		switch_turn
		return true
	end

	private

	def switch_turn
		if @turn == PLAYER_ONE
			@turn = PLAYER_TWO
		else
			@turn = PLAYER_ONE
		end
	end

end

board = Board.new
board.make_move(2,0)


