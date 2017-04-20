class Word < ActiveRecord::Base
  has_many :word_comments
  has_many :comments, through: :word_comments

  def most_frequent_word_by_year(year)
    word = Word.find_by(word: self.word)
    return nil if !word
    comments = get_associated_comments(word,year)
    words = reject_input_word(year)
    word_count = get_word_count(words)
    most_frequent_word = get_most_frequent_word(word_count)
    return nil if !most_frequent_word
    cli_results(most_frequent_word)
    most_frequent_word[0]
  end

  def find_related_word_for_years(years)
    all_good = true

    while true
      years.each do |year|
        returned_word = most_frequent_word_by_year(year)
        if !returned_word
          all_good = false
          puts "Sorry, couldn't find that word for both years. Enter another word!"
          ####BREAK THIS OUT###
          input_word = gets.chomp
          break
        else
          all_good = true
        end
      end
      break if all_good
    end
  end

  def get_associated_comments(word,year)
    associated_comments = word.comments.select do |comment|
      comment[:created_utc] >= year[0] && comment[:created_utc] <= year[-1]
    end
  end

  def reject_input_word(year)
    comments_from_year = self.comments.select do |comment|
      comment[:created_utc] > year[0] && comment[:created_utc] < year[-1]
    end
    words = comments_from_year.collect do |comment|
      comment.words
    end.flatten
    words.reject do |word|
      word.id == self.id
    end
  end

  def get_word_count(words)
    word_count = {}
    words.each do |word|
      # if our word string isn't in our hash, put it in our hash with a count of one
      if !word_count.keys.include?(word[:word])
        word_count[word[:word]] = 1
      # otherwise increment the count in our hash at the word string key
      else
        word_count[word[:word]] += 1
      end
    end
    word_count
  end

  def get_most_frequent_word(word_count)
    most_frequent_word = word_count.max_by do |word, count|
      count
    end
  end

end
