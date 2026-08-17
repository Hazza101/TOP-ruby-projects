class Board
	attr_reader :board

	NONE = 0
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

	def check_winner
		winner = NONE
		(0..2).each do |i|
			row = []
			col = []
			(0..2).each do |j|
				row.push(board[i][j])
				col.push(board[j][i])
			end

			winner = PLAYER_TWO if row.all? { |x| x == PLAYER_TWO }
			winner = PLAYER_ONE if row.all? { |x| x == PLAYER_ONE }
			winner = PLAYER_TWO if col.all? { |x| x == PLAYER_TWO }
			winner = PLAYER_ONE if col.all? { |x| x == PLAYER_ONE }

			return winner if winner != NONE

		end
		return winner
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


