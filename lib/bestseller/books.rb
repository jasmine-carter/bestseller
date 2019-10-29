class Books
  attr_accesor :title, :author, :publisher, :description, :time_on_list, :category
  
  @@all = []
  
  def initialize (title, author)
    @title = title
    @author = author
  end
  
end  