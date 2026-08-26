module Helper
  def self.compare_rows(original, guess)
    result = []
    remainding = []
    (0...4).each do |i|
      if original[i] == guess[i]
        result.push('white')
      else
        remainding.push(original[i])
      end
    end
    guess.uniq.each do |peg|
      result.push('black') if remainding.include?(peg)
    end

    result
  end

  def self.create_row(row)
    unless row.is_a?(String) or row.is_a?(Array) or row.is_a?(Integer)
      raise ArgumentError, 'Argument must be a String, Array or Integer'
    end

    if row.is_a?(Integer)
      row = row.digits.reverse
    elsif row.is_a?(String)
      raise ArgumentError, 'String Argument must only contain digits' unless row.match(/^\d+$/)

      row = Integer(row).digits.reverse
    end
    raise ArgumentError, 'There must be 4 digits' if row.size != 4

    Row.new(*row)
  end

  def self.create_mastermind_row(row)
    unless row.is_a?(String) or row.is_a?(Array) or row.is_a?(Integer)
      raise ArgumentError, 'Argument must be a String, Array or Integer'
    end

    if row.is_a?(Integer)
      row = row.digits.reverse
    elsif row.is_a?(String)
      raise ArgumentError, 'String Argument must only contain digits' unless row.match(/^\d+$/)

      row = Integer(row).digits.reverse
    end
    raise ArgumentError, 'There must be 4 digits' if row.size != 4
    raise ArgumentError, 'The 4 digits must be unique' if row.uniq.size != 4

    Row.new(*row)
  end
end
