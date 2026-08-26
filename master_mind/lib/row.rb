class Row
  include Enumerable

  def initialize(peg1, peg2, peg3, peg4)
    white_list = [1, 2, 3, 4, 5, 6]
    if !white_list.include?(peg1) or !white_list.include?(peg2) or !white_list.include?(peg3) or !white_list.include?(peg4)
      raise ArgumentException, 'Number must 1, 2, 3, 4, 5, 6'
    end

    @row_list = [peg1, peg2, peg3, peg4]
    @row_set = Set.new(@row_list)
  end

  def each(&block)
    if block_given?
      @row_list.each(&block)
    else
      to_enum(:row_set)
    end
  end

  def [](index)
    @row_list[index]
  end

  def contains?(peg)
    @row_set.include?(peg)
  end
end
