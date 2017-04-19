


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
    comment.words.reject do |word_object|
      word_object.id == word.id
      #binding.pry
    end
  end.flatten

  associated_words.each do |word|
    puts word[:word]
  end

  # word_object = Word.find_by(word: "#{word}")
  # word_object.comments.each_with_index do |comment, index|
  #   puts
  #   puts "Comment: #{index+1}"
  #   puts comment[:body]
  #   puts
  # end
