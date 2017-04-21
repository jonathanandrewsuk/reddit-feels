
def cli_welcome
  a = Artii::Base.new :font => 'slant'
  puts a.asciify('Reddit Feels').colorize(:red)

  puts "Hello welcome to reddit feels!"
  puts "Please enter a word"
end


def cli_results(most_frequent_word, index)
  before_after = ["before", "after"]
  puts ""
  puts "The most frequent word #{before_after[index]} Obama was: #{most_frequent_word[0]} with a count of #{most_frequent_word[1]}."
  a = Artii::Base.new :font => 'slant'
  puts a.asciify("#{most_frequent_word[0]}")
end

def did_obama_do_well
  puts "Did Obama do well? (Y/N)"
  decision = gets.chomp
  if decision.downcase == "y"
    print_picture("obama.png", "Thanks Obama")
  else
    print_picture("trump.png", "Thanks for NOTHING Obama")
  end
  go_again
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
    puts ""
end

def go_again
  puts "Would you like another go? (Y/N)"
  decision = gets.chomp
  if decision.downcase == "y"
    run
  else
    puts ""
    puts "Keep the change, ya filthy animal.".colorize(:red)
    puts ""
  end
end
