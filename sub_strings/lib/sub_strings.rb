def find_substring(phrase, sub)
  count = 0
  sub_index = 0
  phrase.split('').each_with_index do |char, index|
    if sub[sub_index] == char
      sub_index += 1
    else
      sub_index = 0
    end
    if sub_index == sub.length
      sub_index = 0
      count += 1
    end
  end
  count
end

def find_substrings(word, dictionary)
  downcase_word = word.downcase
  dictionary.each_with_object({}) do |substring, counter|
    count = find_substring(downcase_word, substring)
    counter[substring] = count if count > 0
    counter
  end
end
