class Word < ActiveRecord::Base
  has_many :word_comments
  has_many :comments, through: :word_comments
end
