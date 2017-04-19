
require "json"

def find_or_create_by_entries_from_json(filename)
  File.open(filename).each do |line|
    parse_json_line(line)
  end
end

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
  words = comment_hash["body"].split
  find_or_create_by_word(words)
end

def find_or_create_by_word(words)
  #todo : filter stop words
  words.collect do |word|
    if Word.exists?(['word LIKE ?',"#{word}"])
      Word.find_by(['word LIKE ?',"#{word}"])
      Word.create(word: word)
    end
end

def associate_words_and_comment(words, comment)
  words.each do |word|
    WordComment.create(word_id: word.id, comment_id: comment.id)
  end
end
