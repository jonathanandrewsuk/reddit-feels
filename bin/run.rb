
require_relative '../config/environment'
require_relative 'cli'

def run
  years = [[1230768000,1233446399], [1483228800,1485907199]]
  cli_welcome
  input_word = Word.find_word_by_string
  input_word.find_related_word_for_years(years)
  did_obama_do_well
end

run
