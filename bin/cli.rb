
def cli_input
  a = Artii::Base.new :font => 'slant'
  puts a.asciify('Reddit Feels')

  puts "Hello welcome to reddit feels!"
  puts "Please enter a word"
  input_word = gets.chomp
  #binding.pry
  input_word
end

def cli_results(most_frequent_word)
  puts "The most frequent word was: #{most_frequent_word[0]} with a count of #{most_frequent_word[1]}."
  a = Artii::Base.new :font => 'slant'
  puts a.asciify("#{most_frequent_word[0]}")
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
