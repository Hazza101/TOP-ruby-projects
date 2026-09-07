require_relative 'lib/board'
require_relative 'lib/printing'
require_relative 'lib/players'

class HumanPlayer
  def make_move(_board)
    Printing.prompt_until_correct
  end
end

class RandomPlayer
  def make_move(board)
    arr = Array.new 
    (0..2).each do |i|
      (0..2).each do |j|
        arr.append([i, j]) if board[i][j] == PLAYERS::NONE
      end
    end
    index = rand(arr.size)
    arr[index]
  end
end

def play_game?(board, _player1, _player2)
  res = board.check_winner?
  while res == PLAYERS::NONE
    Printing.display_board(board.board)
    if board.turn == PLAYERS::PLAYER_ONE
      i, j = _player1.make_move(board.board)
    else
      i, j = _player2.make_move(board.board)
    end
    is_valid_move = board.make_move(i, j)
    unless is_valid_move
      puts 'Please make a valid move'
      next
    end
    res = board.check_winner?
  end
  Printing.display_board(board.board)
  res
end

def main_loop
  board = Board.new
  player1 = RandomPlayer.new
  player2 = RandomPlayer.new
  result = play_game?(board, player1, player2)
  puts "Player 1 (x) won" if result == PLAYERS::PLAYER_ONE
  puts "Player 2 (o) won" if result == PLAYERS::PLAYER_TWO
  puts "It was a draw" if result == PLAYERS::DRAW
end

main_loop
