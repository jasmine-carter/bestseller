#require 'pry'
#require 'open-uri'
#require 'nokogiri'
class Books
  attr_accessor :title, :author, :description, :time_on_list, :category, :publisher

  @@all = []

  def initialize(title, author, description, time_on_list, publisher, category)
      @title = title
      @author = author
      @description = description
      @time_on_list = time_on_list
      @publisher = publisher
      @category = category
      @@all << self
  end

  #category_url = "books/best-sellers/combined-print-and-e-book-fiction/"
  def self.create_from_category(category_name, category_url) #make a scraper class - a book doesn't need to know source
    site = "https://www.nytimes.com/#{category_url}"
    doc = Nokogiri::HTML(open(site))
    #book_container = doc.css(".css-xe4cfy")
    book_container = doc.css(".css-12yzwg4 > li")
    book_container.each do |book|
      title = book.css("h3").text.downcase.split(" ").map {|s| s.capitalize}.join(" ")
      author = book.css(".css-1j7a9fx").text #look at this returning ""
      description = book.css(".css-14lubdp").text #look at this returning ""
      time_on_list = book.css(".css-1o26r9v").text #look at this returning ""
      publisher = book.css(".css-heg334").text #look at this returning ""
      category = category_name
      self.new(title, author, description, time_on_list, publisher, category)
    end
  end

  def self.all
    @@all
  end

  #create a method to associate categories with book

end
