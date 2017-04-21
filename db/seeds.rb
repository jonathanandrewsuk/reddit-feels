require_relative './parse.rb'

#filenames = ['./db/reddit-json/RC_2009-01', './db/reddit-json/RC_2017-01']
filenames = ['db/reddit-json/two_hundred_comments.json']

count = 6000

filenames.each do |filename|
  find_or_create_by_entries_from_json(filename, count)
end
