# HumanCodemaker class which allows the user to input the mastermind code
class HumanCodemaker
  def initialize
    @code = nil
  end

  def create_mastermind_row
    valid = false
    until valid
      print 'Choose mastermind code> '
      input = gets.chomp
      begin
        @code = Helper.create_mastermind_row(input)
        return @code
      rescue ArgumentError
        puts 'Invalid input'
      end
    end
  end

  def return_mastermind_row
    @code
  end
end
