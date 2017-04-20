
def cli_input
  a = Artii::Base.new :font => 'slant'
  puts a.asciify('Reddit Feels')

  puts "Hello welcome to reddit feels!"
  puts "Please enter a word"
  input_word = gets.chomp
end

def cli_results(most_frequent_word)
  puts "The most frequent word was: #{most_frequent_word[0]} with a count of #{most_frequent_word[1]}."
  a = Artii::Base.new :font => 'slant'
  puts a.asciify("#{most_frequent_word[0]}")
end
