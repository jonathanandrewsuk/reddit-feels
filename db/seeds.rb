require "pry"

require_relative './parse.rb'
require_relative './comments.rb'

comments_arr = parse

comments_arr.shift

# create new instances of guest class through parsed CSV file
comments_arr.each { |comment|
  Guest.new(body: comment[0], created_utc: comment[1], author: comment[2])
}
