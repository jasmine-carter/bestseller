class Scraper
  include BestSeller

  def self.scrape_categories #throw in scraper class
    doc = Nokogiri::HTML(open('https://www.nytimes.com/books/best-sellers/'))
    cat_list = doc.css("section").css("h2")
    #binding.pry - may be good blog post why was I getting nil?
    cat_list.each_with_index {|cat, i|
      name = cat_list[i].text
      url = cat_list.children[i].attribute("href").value
      Categories.new(name, url)
    }
  end

#should this be moved to Categories Class?
  def self.create_books_from_category(category)
    site = "https://www.nytimes.com/#{category.url}"
    doc = Nokogiri::HTML(open(site))
    book_container = doc.css(".css-12yzwg4 > li")
    book_container.each do |book|
      title = book.css("h3").text.downcase.split(" ").map {|s| s.capitalize}.join(" ")
      author = book.css(".css-hjukut").text #isn't getting scraped properly
      description = book.css(".css-14lubdp").text
      time_on_list = book.css(".css-1o26r9v").text
      publisher = book.css(".css-heg334").text
      b_category = category
      newbook = Books.new(title, author, description, time_on_list, publisher, b_category)
      category.books << newbook
    end
  end

end
