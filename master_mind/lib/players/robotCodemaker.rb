# RobotCodemaker class which allows the program to automatically generate the code to be guessed
class RobotCodemaker
  def initialize
    @code = nil
  end

  def create_mastermind_row
    array = (1..6).to_a.shuffle.take(4)
    @code = Row.new(*array)
  end

  def return_mastermind_row
    @code
  end
end
