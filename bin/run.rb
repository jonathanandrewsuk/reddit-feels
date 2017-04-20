
  require_relative '../config/environment'
  require_relative 'cli'

  input_word = cli_input

  years = [[1230768000,1233446399], [1483228800,1485907199]]



def most_frequent_word_by_year(input_word, year)
  word = Word.find_by(word: input_word)
  return nil if !word
  comments = get_associated_comments(word,year)
  words = reject_input_word(comments, word)
  word_count = get_word_count(words)
  most_frequent_word = get_most_frequent_word(word_count)
  return nil if !most_frequent_word
  cli_results(most_frequent_word)
  most_frequent_word[0]
end

def find_related_word_for_years(input_word,years)
  all_good = true

  while true
    years.each do |year|
      returned_word = most_frequent_word_by_year(input_word,year)
      #binding.pry
      if !returned_word
        all_good = false
        puts "Sorry, couldn't find that word for both years. Enter another word!"
        input_word = gets.chomp
        break
      else
        all_good = true
      end
    end
    break if all_good
  end
end





def did_obama_do_well
  puts "Did Obama do well? (Y/N)"
  decision = gets.chomp
  if decision == "y" || decision == "Y"
    print_picture("obama.png", "Thanks Obama")
  else
    print_picture("trump.png", "Thanks for NOTHING Obama")
  end
end

def print_picture(image, message)
  Catpix::print_image image,
    :limit_x => 0.3,
    :limit_y => 0,
    :center_x => false,
    :center_y => true,
    :bg => "white",
    :bg_fill => false,
    :resolution => "high"
    puts message
end

def get_associated_comments(word,year)
  associated_comments = word.comments.select do |comment|
    comment[:created_utc] >= year[0] && comment[:created_utc] <= year[-1]
  end
end

def reject_input_word(comments, word)
  comments.collect do |comment|
    comment.words.reject do |word_object|
      word_object.id == word.id
    end
  end.flatten
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

#calls
find_related_word_for_years(input_word,years)
did_obama_do_well
