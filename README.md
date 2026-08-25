## Ruby Projects
These are the ruby projects from The Odin Projects ruby course.

### Project: Caesar Cipher
The goal was to implement a function that performs a Caesar cipher. A Caesar cipher is a simple substitution cipher that shifts each letter by a specified amount.

#### Usage
```ruby
shift = 5
plaintext = "What a string!"
caesar_cipher(plaintext, shift)
#=> Bmfy f xywnsl!
```

### Project: Sub Strings
The project requirements were to implement a function that takes a list of words and a string as a parameter, and count the number of times each word appears in the string.

#### Usage
```ruby
dictionary = %w[below down go going horn how howdy it i low own part partner sit]
phrase = 'below'
find_substrings(phrase, dictionary)
#=> {"below" => 1, "low" => 1}
```

### Project: Stock Picker
Given a list of stock prices for each day, determine the best day to buy and sell that returns the maximum profit.

#### Usage
```ruby
stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
stock_picker(stock_prices)
#=> [1, 4]
```

### Project: Bubble Sort
Bubble sort is a sorting algorithm that compares adjacent cells in a list and swaps them based on the sorting condition. This implementation allows for a lambda function that specifies the comparison.

#### Usage
```ruby
numbers = [4, 3, 78, 2, 0, 2]
bubble_sort(numbers, ->(a, b) { a < b }) # lambda function for descending sort
#=> [78, 4, 3, 2, 2, 0]
```

### Project: Tic Tac Toe
Unfinished project

### Project: Mastermind
Need to add Computer Code breaker
