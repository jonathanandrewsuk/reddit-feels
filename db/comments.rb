class Comment
  attr_reader :body, :created_utc, :author

  ALL = []

  def initialize(body:, created_utc:, author:)
    @body = body
    @created_utc = created_utc
    @author = author
    ALL << self
  end

  def self.all
    ALL
  end

  def self.save (body, created_utc, author, db)
    db.execute("INSERT INTO guests (body, created_utc, author) VALUES (?, ?, ?)", body, created_utc, author)
  end

  def self.make_db (db)
    self.all.each { |comment|
      self.save(comment.body, comment.created_utc, comment.author, db)
    }
  end

end
