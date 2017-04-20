
  require_relative './config/environment'



  a = Artii::Base.new :font => 'slant'
  puts a.asciify('Reddit Feels')

  puts "Hello welcome to reddit feels!"
  puts "Please enter a word"
  input_word = gets.chomp

  years = [[1230768000,1233446399], [1483228800,1485907199]]



def most_frequent_word_by_years(year, input_word)
  word = Word.find_by(word: input_word)
  return nil if !word

  associated_words_count = {}

  associated_comments = word.comments.select do |comment|
    comment[:created_utc] >= year[0] && comment[:created_utc] <= year[-1]
  end
#reject input word from array
  associated_words = associated_comments.collect do |comment|
    filtered_words = comment.words.reject do |word_object|
      word_object.id == word.id
    end

    #
    filtered_words.each do |word|
      # if our word string isn't in our hash, put it in our hash with a count of one
      if !associated_words_count.keys.include?(word[:word])
        associated_words_count[word[:word]] = 1
      # otherwise increment the count in our hash at the word string key
      else
        associated_words_count[word[:word]] += 1
      end
      # binding.pry
    end
    filtered_words
  end.flatten



  most_frequent_word = associated_words_count.max_by do |word, count|
    count
  end


  #binding.pry
  return nil if !most_frequent_word


  puts "The most frequent word was: #{most_frequent_word[0]} with a count of #{most_frequent_word[1]}."
  a = Artii::Base.new :font => 'slant'
  puts a.asciify("#{most_frequent_word[0]}")
  # before_after.unshift
  most_frequent_word[0]
end

all_good = true

while true
  years.each do |year|
    returned_word = most_frequent_word_by_years(year, input_word)
    #binding.pry
    if !returned_word
      all_good = false
      puts "Sorry, couldn't find that word for both years. Enter another word!"
      input_word = gets.chomp
      break
    else
      all_good = true
    end
  end
  break if all_good
end


puts "Did Obama do well? (Y/N)"
input_word2 = gets.chomp
require 'catpix'

if input_word2 == "y" || input_word2 == "Y"

Catpix::print_image "obama3.png",
  :limit_x => 0.3,
  :limit_y => 0,
  :center_x => false,
  :center_y => true,
  :bg => "white",
  :bg_fill => false,
  :resolution => "high"
  puts "Thanks Obama"

else
  Catpix::print_image "trump.png",
    :limit_x => 0.3,
    :limit_y => 0,
    :center_x => false,
    :center_y => true,
    :bg => "white",
    :bg_fill => false,
    :resolution => "high"
    puts "Thanks for nothing Obama"
end
