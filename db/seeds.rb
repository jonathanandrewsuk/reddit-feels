# require "pry"

require_relative './parse.rb'


# filename = './db/reddit-json/five_comments.json'
filename = './db/reddit-json/hundred_comments.json'
# filename = '/Users/isaacanderson/Code/reddit-feels/db/reddit-json/RC_2006-01'
# should include this in parse body
# parse(filename).each do |comment_hash| # returns an array of comment hashes
find_or_create_by_entries_from_json(filename)
# binding.pry
