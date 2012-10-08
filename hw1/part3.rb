def combine_anagrams(words)
  sorted = {}
  words.each do |word|
    s = word.downcase.chars.sort.join
    sorted[s] = [] if sorted[s].nil?
    sorted[s] << word
  end
  sorted.values
end

print combine_anagrams( ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'Scream'] )
print combine_anagrams( [] )
