require 'pry'
require 'open-uri'
require 'nokogiri'
class Books
  attr_accessor :title, :author, :description, :time_on_list, :category, :publisher

  @@all = []

  def initialize(title, author, description, time_on_list, publisher, category)
      @title = title
      @author = author
      @description = description
      @time_on_list = time_on_list
      @publisher = publisher
      @@all << self
  end

  #category_url = "books/best-sellers/combined-print-and-e-book-fiction/"
  def self.create_from_category(category_name, category_url)
    site = "https://www.nytimes.com/#{category_url}"
    doc = Nokogiri::HTML(open(site))
    book_container = doc.css(".css-xe4cfy")
    book_container.each_with_index {|book, i|
      title = book_container.css(".css-5pe77f").css("h3")[i].text
      author = book_container.css(".css-1j7a9fx").css("p")[i].text
      description = book_container.(".css-14lubdp").css("p")[i].text
      time_on_list = book_container.css(".css-1o26r9v").css("p")[i].text
      publisher = book_container.css(".css-heg334").css("p")[i].text
      category = category_name
      self.new(title, author, description, time_on_list, publisher, category)
    }
  end

  def self.all
    @@all
  end

  #create a method to associate categories with book

end
