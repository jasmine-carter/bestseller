class Books
  attr_accesor :title, :author, :description, :time_on_list, :category
  #possibly drop :publisher, output is quite busy
  
  @@all = []
  
  def initialize (title, author, category, description, time_on_list)
    @title = title
    @author = author
    @category = category
    @description = description
    @time_on_list = time_on_list
  end
  
  def self.all
    @@all = []
  end
  
  
end  