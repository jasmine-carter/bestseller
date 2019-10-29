class Categories
  attr_accessor :name
  
  #has many books
  #gets created with a name
  #should be able to return all instances of Categories
  
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end  
  
  def self.all
    @@all
  end  
end  