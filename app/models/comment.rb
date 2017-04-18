class Comment < ActiveRecord::Base
  has_many :word_comments
  has_many :words, through: :word_comments
end
