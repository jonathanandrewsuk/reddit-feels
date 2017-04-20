# require "pry"

require_relative './parse.rb'



filenames = ['./db/reddit-json/RC_2006-01', './db/reddit-json/Jan-20-2009']


filenames.each do |filename|

find_or_create_by_entries_from_json(filename)

end

# binding.pry
