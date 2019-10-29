class Categories
  attr_accessor :name, :books
  
  #has many books
  #gets created with a name
  #should be able to return all instances of Categories
  #can return all books under a given category
  #can count all books in a given category?
  
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end  
  
  def self.all
    @@all
  end  
  
  def books_by_category
    #returns a categories books by category name
    #Books.all.select do |book|
     # book.category == self
    end  
  end
  
end  