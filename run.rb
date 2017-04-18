require 'active_record'


  ENV["ACTIVE_RECORD_ENV"] ||= "development"
  require_relative './config/environment'


include ActiveRecord::Tasks
DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths = 'db/migrate'
seed_loader = Class.new do
  def load_seed
    load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
  end
end
DatabaseTasks.seed_loader = seed_loader.new
load 'active_record/railties/databases.rake'

# task :seed => :environment do
#   load_seed
# end



  puts "Hello welcome to this thing"
  puts "Please enter a word"
  word = gets.chomp
  word_object = Word.find_by(word: "#{word}")
  word_object.comments.each_with_index do |comment, index|
    puts "Comment #{index+1}"
    puts comment[:body]
  end
