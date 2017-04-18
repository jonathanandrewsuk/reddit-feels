
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
      if Word.exists?(['name LIKE ?', "%#{word}%"])
        # associate word with comment
      else
        Word.create({word: word})
      # if word not in table, create/insert word
      end
    end
  end
end

#binding.pry

# "Gello"
