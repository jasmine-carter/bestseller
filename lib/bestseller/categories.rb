class Categories
  include BestSeller

  attr_accessor :name, :books, :url

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @books = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.return_or_create
    if Categories.all.count == 0
      Scraper.scrape_categories
    end
  end

  def self.display_books_by_category(category) #returns a number list of books by category name
    n = 1
    Books.all.select do |book|
      if book.category.name == category.name
      puts "#{n}. #{book.title}"
      n += 1
      end
    end
  end

  def self.books #returns all books by category name
    Books.all.select do |book|
      book.category == self.name
    end
  end

end
