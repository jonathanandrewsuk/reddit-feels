


  ENV["ACTIVE_RECORD_ENV"] ||= "development"
  require_relative './config/environment'

  include ActiveRecord::Tasks

  puts "Hello welcome to reddit feels!"
  puts "Please enter a word"
  input_word = gets.chomp
  puts

  word = Word.find_by(word: input_word)
  associated_words_count = {}

  associated_words = word.comments.collect do |comment|
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

  # associated_words.each do |word|
  #   puts word[:word]
  # end

  most_frequent_word = associated_words_count.max_by do |word, count|
    count
  end

  puts "The most frequent word was: #{most_frequent_word[0]} with a count of #{most_frequent_word[1]}. Yay."

  # word_object = Word.find_by(word: "#{word}")
  # word_object.comments.each_with_index do |comment, index|
  #   puts
  #   puts "Comment: #{index+1}"
  #   puts comment[:body]
  #   puts
  # end
