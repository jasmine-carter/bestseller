#require 'pry'
#require 'nokogiri'
#require 'open-uri'

class Categories #nest under bestseller class
  attr_accessor :name, :books, :url

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @books = []
    @@all << self
  end

  def self.scrape_categories #throw in scraper class
    doc = Nokogiri::HTML(open('https://www.nytimes.com/books/best-sellers/'))
    cat_list = doc.css("section").css("h2")
    #binding.pry - may be good blog post why was I getting nil?
    cat_list.each_with_index {|cat, i|
      name = cat_list[i].text
      url = cat_list.children[i].attribute("href").value
      self.new(name, url)
    }
  end

  def self.all
    @@all
  end

  def self.display_books_by_category(category_name) #returns a number list of books by category name
    n = 1
    Books.all.select do |book|
      book.category == category_name
      puts "#{n}. #{book.title}"
      n += 1
    end
  end

  def self.books #returns all books by category name
    Books.all.select do |book|
      book.category == self.name
    end
  end

end
