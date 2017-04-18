# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require "pry"
require "json"

def parse
  comments_arr = JSON.read('comments.json')

  comments_arr
end
