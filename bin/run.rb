
require_relative '../config/environment'
require_relative 'cli'
input_word = nil
while input_word == nil
  input_word = Word.find_by(word: cli_input) ##### fix this, it's baaaaaad
end



years = [[1230768000,1233446399], [1483228800,1485907199]]

#calls
input_word.find_related_word_for_years(years)
did_obama_do_well
