def palindrome?(input)
  input.downcase!.gsub!(/\W/,"")
  input == input.reverse
end

def count_words(input)
  word_counts = {}
  # split on words 
  input.downcase.gsub!(/\w+\b/).each { |word|
    if word_counts[word].nil? 
      word_counts[word] = 1
    else
      word_counts[word] += 1
    end
  }
  word_counts
end
