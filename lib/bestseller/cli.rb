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
         #example input "book 2"
         #takes the input, strips to number of the book
         #need to get from string input of book 2, to be a book title for show_selected_book_info method
         self.show_selected_book_info(input)
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

  def self.show_selected_book_info(book_name)#method takes the string selection input of a user and finds the matching book object
    book = Books.find_by_title(book_name)
    puts "Time on the Best Seller List:#{book.time_on_list}"
    puts "Title: #{book.title}, #{book.author}"
    puts "Published by #{book.publisher}"
    puts "#{book.description}"
  end

  def goodbye
    puts "Happy Reading!"
  end
end
