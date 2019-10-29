class Categories
  attr_accessor :name, :books, :url
  
  #has many books
  #gets created with a name
  #should be able to return all instances of Categories
  #can return all books under a given category
  #can count all books in a given category?
  
  @@all = []
  def initialize
    @@all << self
  end  
  
  def self.scrape_categories
    #doc = Nokogiri::HTML(open('https://www.nytimes.com/books/best-sellers/'))
    #for each element in whatever css class category names are contained in
    #scrape name, scrape url and assign those values
   
    category_1 = self.new
    category_1.name = "Combined Print & E-Book Fiction"
    category_1.url = "https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-nonfiction/"
    
    category_2 = self.new
    category_2.name = "Hardcover Fiction"
    category_2.url = "https://www.nytimes.com/books/best-sellers/hardcover-fiction/"
    
    category_1.name
    category_2.name
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