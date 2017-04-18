# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require "pry"
require "json"

def parse
  JSON.parse('./db/reddit-json/five_comments.json')
end

binding.pry

"Gello"
