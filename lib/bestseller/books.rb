#require 'pry'
#require 'open-uri'
#require 'nokogiri'
class Books
  include BestSeller

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

  def self.find_or_create_from_category(category)
      if category.books.count == 0
        Scraper.create_books_from_category(category)
      else
        category.books
      end
  end

  def self.all
    @@all
  end

end
