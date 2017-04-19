require "csv"

class Filter

  csv_file = File.open("db/action_verbs.csv")

  csv_contents = CSV.read(csv_file).flatten

  ALL = csv_contents.collect do |word|
    word.downcase
  end

  def self.all
    ALL
  end

end
