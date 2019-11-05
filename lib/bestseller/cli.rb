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
    #while input != "exit"
      #case when input is an integer list_books_by_categories(input)
      #case when input is a string get_book_information
      #input = gets.chomp
      #list_books_by_categories(input)
       #puts "If you'd like to see more info on any of these books, enter book title. If you'd like to go back to categories, type categories, or type exit."

       #revised case statement for input handling
       input = gets.chomp
       case input
       when "exit"
         goodbye
       when input.downcase.include?("category")
         list_books_by_categories(input[-1].to_i)
       when input.downcase.include?("book")
         #show selected book get_book_information
       when input == "categories"
         list_categories
       else
        puts "Command not recognized. Type \"categories\" to view a list of categories.\n Type exit to end."

    end
  end

  def list_categories
    #it will put all categories scraped from NYTimes best seller list
    #Categories.scrape_categories #this will initiate scraping of categories
    Categories.return_or_create
    Categories.all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end


  def list_books_by_categories(input)
    input = input.to_i
    if input >= 1 && input <= Categories.all.length && (1..Categories.all.length).include?(input)
        category = Categories.all[input-1]
        puts "You've selected, #{Categories.all[input-1].name}."
        Books.create_from_category(category)
        Categories.display_books_by_category(category.name)
      else
        puts "Sorry, I don't recognize that category number."
    end
  end

  def selected_book(book_name) #this method finds the book the use selected from Books.all
    Books.all.select do |b|
      b.title == book_name
    end
  end

  def show_selected_book_info #this method shows user all of a given book's information
    book = selected_book(book_name)
    puts "Time on the Best Seller List:#{book.time_on_list}"
    puts "Title: #{book.name}, #{book.author}"
    puts "Published by #{book.publisher}"
    puts "#{book.description}"
  end

  def goodbye
    puts "Happy Reading!"
  end
end
