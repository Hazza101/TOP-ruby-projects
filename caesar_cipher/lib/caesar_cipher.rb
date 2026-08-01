DOWNCASE_LOWER = 'a'.ord
DOWNCASE_UPPER = 'z'.ord
UPCASE_LOWER = 'A'.ord
UPCASE_UPPER = 'Z'.ord

def shift_letter(char, shift)
  code = char.ord
  return char if !code.between?(DOWNCASE_LOWER, DOWNCASE_UPPER) && !code.between?(UPCASE_LOWER, UPCASE_UPPER)

  diff = 0
  diff = if code.between?(DOWNCASE_LOWER, DOWNCASE_UPPER)
           DOWNCASE_LOWER
         else
           UPCASE_LOWER
         end
  new_code = ((code - diff) + shift) % 26 + diff
  new_code.chr
end

def caesar_cipher(string, shift)
  string.split('').map do |char|
    shift_letter(char, shift)
  end.join
end
