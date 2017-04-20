


  ENV["ACTIVE_RECORD_ENV"] ||= "development"
  require_relative './config/environment'

  include ActiveRecord::Tasks

  a = Artii::Base.new :font => 'slant'
  puts a.asciify('Reddit Feels')

  puts "Hello welcome to reddit feels!"
  puts "Please enter a word"
  input_word = gets.chomp

  years = [[1136073600,1138751999], [1232409600,1232495999]]



def most_frequent_word_by_years(year, input_word)
  word = Word.find_by(word: input_word)
  associated_words_count = {}

  associated_comments = word.comments.select do |comment|
    comment[:created_utc] >= year[0] && comment[:created_utc] <= year[-1]
  end

  associated_words = associated_comments.collect do |comment|
    filtered_words = comment.words.reject do |word_object|
      word_object.id == word.id
    end
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

  before_after = ["before","after"]



  puts "The most frequent word #{before_after[0]} was: #{most_frequent_word[0]} with a count of #{most_frequent_word[1]}."
  a = Artii::Base.new :font => 'slant'
  puts a.asciify("#{most_frequent_word[0]}")
  before_after.unshift
end

years.each do |year|
  most_frequent_word_by_years(year, input_word)
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
    puts "Thanks for nothing obama"
end
