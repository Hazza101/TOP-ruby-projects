module Printing
  def self.display_board(board)
    m = board.size
    n = board[0].size
    (0...m).each do |i|
      print '|'
      (0...n).each do |j|
        val = case board[i][j]
              when 1
                'X'
              when 2
                'O'
              else
                ' '
              end
        print "#{val}|"
      end
      print "\n"
    end
  end

  def self.print_winner(winner)
    case winner
    when 1
      puts '##########################'
      puts '#####   X is winner  #####'
      puts '##########################'
    when 2
      puts '##########################'
      puts '#####   O is winner  #####'
      puts '##########################'
    else
      puts '#####   No winner    #####'
    end
  end

  def self.prompt_once
    print 'pos> '
    input = gets.chomp
    pattern = /^(\d+)[,-|](\d+)$/.match(input)
    return -1, -1 unless pattern

    i = pattern[1].to_i
    j = pattern[2].to_i
    return -1, -1 if !i.between?(0, 2) || !j.between?(0, 2)

    [i, j]
  end

  def self.prompt_until_correct
    i, j = prompt_once
    while i == -1
      puts 'Invalid input: enter coords like [i],[j] between 0 and 3.'
      i, j = prompt_once
    end
    [i, j]
  end
end
