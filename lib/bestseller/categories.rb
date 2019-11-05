#require 'pry'
#require 'nokogiri'
#require 'open-uri'

class Categories #nest under bestseller class
  attr_accessor :name, :books, :url

  #can return all books under a given category
  #can count all books in a given category?

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
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

  def self.books_by_category(category_name)
    #returns a categories books by category name
    Books.all.select do |book|
      book.category == category_name
      puts book.title
    end
  end

end
