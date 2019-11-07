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
  def self.create_from_category(category) #make a scraper class - a book doesn't need to know source
    #need to pass an argument of category, not attr of category
    site = "https://www.nytimes.com/#{category.url}"
    doc = Nokogiri::HTML(open(site))
    book_container = doc.css(".css-12yzwg4 > li")
    book_container.each do |book|
      title = book.css("h3").text.downcase.split(" ").map {|s| s.capitalize}.join(" ")
      author = book.css(".css-1j7a9fx").text
      description = book.css(".css-14lubdp").text
      time_on_list = book.css(".css-1o26r9v").text
      publisher = book.css(".css-heg334").text
      b_category = category
      newbook = self.new(title, author, description, time_on_list, publisher, b_category)
      category.books << newbook
    end
  end

  def self.find_or_create_from_category(category)
      if category.books.count == 0
        Books.create_from_category(category)
      else
        category.books
      end
  end

  def self.find_by_title(title)
    Books.all.detect {|book| book.title == title}
  end

  def self.all
    @@all
  end

end
