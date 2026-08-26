# HumanCodebreaker class which allows the user to input their guesses for the code
class HumanCodebreaker
  def get_row_guess(guess)
    valid = false
    until valid
      print "Row guess [#{guess}]> "
      input = gets.chomp
      begin
        row = Helper.create_row(input)
        return row
      rescue ArgumentError
        puts 'Invalid input'
      end
    end
  end

  def recieve_feedback(feedback)
    nil
  end
end
