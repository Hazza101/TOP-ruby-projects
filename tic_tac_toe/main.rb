require_relative 'lib/board'
require_relative 'lib/printing'
require_relative 'lib/players'

def play_game?(board, _player1, _player2)
  res = board.check_winner?
  while res == PLAYERS::NONE
    Printing.display_board(board.board)
    i, j = Printing.prompt_until_correct
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
  result = play_game?(board, nil, nil)
  puts "Player 1 (x) won" if result == PLAYERS::PLAYER_ONE
  puts "Player 2 (o) won" if result == PLAYERS::PLAYER_TWO
  puts "It was a draw" if result == PLAYERS::DRAW
end

main_loop
