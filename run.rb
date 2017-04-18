


  ENV["ACTIVE_RECORD_ENV"] ||= "development"
  require_relative './config/environment'

  include ActiveRecord::Tasks

  puts "Hello welcome to reddit feels!"
  puts "Please enter a word"
  word = gets.chomp
  word_object = Word.find_by(word: "#{word}")
  word_object.comments.each_with_index do |comment, index|
    puts
    puts "Comment: #{index+1}"
    puts comment[:body]
    puts
  end
