class WordComment < ActiveRecord::Base
  belongs_to :word
  belongs_to :comment  
end
