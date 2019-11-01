class BestSeller::CLI

  def call
    puts "Welcome to the New York Times Best Seller CLI!"
    list_categories
    menu
    goodbye
  end

  def menu
    puts "If you'd like to see books within a category, enter the category number:"
    input = ""
    while input != "exit"
      input = gets.chomp
      list_books_by_categories(input)
       puts "If you'd like to see more info on any of these books, enter book number. If you'd like to go back to categories, type categories, or type exit."
    end
  end


  def list_categories
    #it will put all categories scraped from NYTimes best seller list
    Categories.scrape_categories #this will initiate scraping of categories
    Categories.all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end

  def list_books_by_category(input)
    input = gets.strip.to_i-1
    if input >= 1 && input <= Categories.all.length && (1..Categories.all.length).include?(input)
      category = Categories.all[input]
      #Books.create_from_category(@name, @url)
    end
  end

  def list_books_by_categories(input)
    input = input.to_i
    if input >= 1 && input <= Categories.all.length && (1..Categories.all.length).include?(input)
        category = Categories.all[input]
        puts "You've selected #{Categories.all[input].name}."
        Books.create_from_category(category.name, category.url)
      else
        puts "Sorry, I don't recognize that category number."
    end
  end

  def goodbye
    puts "Happy Reading!"
  end
end
