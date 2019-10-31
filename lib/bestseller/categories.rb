require 'pry'
require 'nokogiri'
require 'open-uri'

class Categories
  attr_accessor :name, :books, :url
  
  #can return all books under a given category
  #can count all books in a given category?
  
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end  
  
  def self.scrape_categories
    doc = Nokogiri::HTML(open('https://www.nytimes.com/books/best-sellers/'))
    cat_list = doc.css("section")
    cat_list.each_with_index {|cat, i|
    binding.pry
      name = cat_list.css("h2").children[i].text
      url = cat_list.css("h2").children[i].attribute("href").value
      self.new(name, url)
    }
  end
  
  def self.all
    @@all
  end  
  
  def books_by_category
    #returns a categories books by category name
    #Books.all.select do |book|
     # book.category == self
    #end  
  end
  
end  