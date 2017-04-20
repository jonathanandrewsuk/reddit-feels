# require "pry"

require_relative './parse.rb'


filenames = ['./db/reddit-json/RC_2009-01', './db/reddit-json/RC_2017-01']
count = 2000

filenames.each do |filename|

  find_or_create_by_entries_from_json(filename, count)

end
#find_or_create_by_entries_from_json(filename2)


# binding.pry
