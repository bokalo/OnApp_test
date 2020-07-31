require "json"
require_relative "./lib/search_language"

class Run

  file = File.open "./data.json"
  @data = JSON.load file

  def self.call()

    loop do
      puts "Enter search params:"
      @search = gets.chomp
      puts "Search params can't be empty." if @search.empty?
      break unless @search.empty?
    end

    res = SearchLanguage.new(@data, @search).execute

    if res.empty?
      puts "There is no language with such params"
    else
      print "You are looking for "
      puts res.size == 1 ? "language:" : "languages:"
      puts res
    end

  end
end
Run.()
