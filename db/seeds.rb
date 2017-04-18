# require "pry"

require_relative './parse.rb'


filename = './db/reddit-json/five_comments.json'
# should include this in parse body
# parse(filename).each do |comment_hash| # returns an array of comment hashes
parse(filename)
# binding.pry
