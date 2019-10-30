require 'nokogiri'
require 'open-uri'
class Books
  attr_accessor :title, :author, :description, :time_on_list, :category
  #possibly drop :publisher, output is quite busy
  
  @@all = []
  
  def create_from_category (category_url)
    #maybe make base uri (https://www.nytimes.com/books/best-sellers/) and append category url to end?
    #all books appear to be in class="css-12yzwg4"
    #doc = Nokogiri::HTML(open(category_url))
    doc = Nokogiri::HTML(open('https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-fiction/'))
    #Overall container = css-12yzwg4
    #Ordered list container = (ol = doc.css(".css-19a8fbx"))
      #Book container = ol.css(".css-xe4cfy")
      	#@name = ol.css(".css-5pe77f").css("h3")[0].text
      	#@author = ol.css(".css-1j7a9fx").css("p")[0].text
      	#@publisher = ol.css(".css-heg334").css("p")[0].text
      	#@time_on_list = ol.css(".css-1o26r9v").css("p")[1].text
      	#@description = ol.css(".css-14lubdp").css("p")[0].text
  end
  
  def self.scrape_by_category
    doc = category.url
  end  
  
  def self.all
    @@all = []
  end
  
  
end  