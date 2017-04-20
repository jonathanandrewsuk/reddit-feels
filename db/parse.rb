
require "json"
require_relative '../db/filter.rb'



def parse_json_line(line)
  comment_hash = JSON.parse(line)
  comment = create_comment_from_hash(comment_hash)
  words = create_words_from_hash(comment_hash)
  associate_words_and_comment(words, comment)
end

def create_comment_from_hash(comment_hash)
  Comment.create({
    body: comment_hash["body"],
    created_utc: comment_hash["created_utc"],
    author: comment_hash["author"]
  })
end

def create_words_from_hash(comment_hash)
  raw_words = comment_hash["body"].split
  raw_words = raw_words.collect do |word|
    word.downcase
  end


  sieve = Stopwords::Snowball::WordSieve.new

  filtered_words = sieve.filter(lang: :en, words: raw_words)
  #binding.pry
  filtered_words = filtered_words.reject { |a| Filter.all.include?(a) }
  #binding.pry
  find_or_create_by_word(filtered_words)
end

def find_or_create_by_word(words)
  words.collect do |word|
    if Word.exists?(['word LIKE ?',"#{word}"])
      Word.find_by(['word LIKE ?',"#{word}"])
    else
      Word.create(word: word)
    end
  end
end

def associate_words_and_comment(words, comment)
  words.each do |word|
    WordComment.create(word_id: word.id, comment_id: comment.id)
  end
end


# connect to Reddit API
def find_or_create_by_entries_from_api()
  session = Redd.it(
    user_agent: '{}',
    client_id:  '{}',
    secret:     '{}',
    username:   '{}',
    password:   '{}'
  )

  session.subreddit('all').comment_stream do |comment|
    puts comment.body
  end
end

def find_or_create_by_entries_from_json(filename, lines_count=File.open(filename).size)
  File.open(filename).take(lines_count).each do |line|
    parse_json_line(line)
  end
end
