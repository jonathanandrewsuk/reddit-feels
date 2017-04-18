
require "json"

def parse(filename)
  File.open(filename).collect do |line|
    comment_hash = JSON.parse(line)
    comment = Comment.create({
      body: comment_hash["body"],
      created_utc: comment_hash["created_utc"],
      author: comment_hash["author"]
      }) # do this for every new row in database
      #binding.pry
    words = comment_hash["body"].split
    words.each do |word|
      # binding.pry
      if Word.exists?(['word LIKE ?',"%#{word}%"])
        word_object = Word.find_by(['word LIKE ?',"%#{word}%"])# associate word with comment
        binding.pry
      else
        word_object = Word.create(word: word)
      # if word not in table, create/insert word
      end
      WordComment.create(word_id: word_object.id, comment_id: comment.id)
    end

  end
end

# binding.pry

# "Gello"
