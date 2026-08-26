require_relative './players'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3, PLAYERS::NONE) }
    @turn = PLAYERS::PLAYER_ONE
  end

  def make_move(i, j)
    return false if !i.between?(0, 2) or !j.between?(0, 2)

    return false if board[i][j] != 0

    board[i][j] = @turn
    switch_turn
    true
  end

  def check_winner?
    winner = PLAYERS::NONE
    winner = PLAYERS::DRAW unless board.any? { |row| row.include?(PLAYERS::NONE) }
    left_diagonal = []
    right_diagonal = []
    (0..2).each do |i|
      row = []
      col = []
      left_diagonal.push(board[i][i])
      right_diagonal.push(board[i][2 - i])
      (0..2).each do |j|
        row.push(board[i][j])
        col.push(board[j][i])
      end

      winner = PLAYERS::PLAYER_TWO if row.all? { |x| x == PLAYERS::PLAYER_TWO }
      winner = PLAYERS::PLAYER_ONE if row.all? { |x| x == PLAYERS::PLAYER_ONE }
      winner = PLAYERS::PLAYER_TWO if col.all? { |x| x == PLAYERS::PLAYER_TWO }
      winner = PLAYERS::PLAYER_ONE if col.all? { |x| x == PLAYERS::PLAYER_ONE }

      return winner if winner != PLAYERS::NONE
    end

    winner = PLAYERS::PLAYER_TWO if left_diagonal.all? { |x| x == PLAYERS::PLAYER_TWO }
    winner = PLAYERS::PLAYER_ONE if left_diagonal.all? { |x| x == PLAYERS::PLAYER_ONE }
    winner = PLAYERS::PLAYER_TWO if right_diagonal.all? { |x| x == PLAYERS::PLAYER_TWO }
    winner = PLAYERS::PLAYER_ONE if right_diagonal.all? { |x| x == PLAYERS::PLAYER_ONE }
    winner
  end

  private

  def switch_turn
    @turn = if @turn == PLAYERS::PLAYER_ONE
              PLAYERS::PLAYER_TWO
            else
              PLAYERS::PLAYER_ONE
            end
  end
end
