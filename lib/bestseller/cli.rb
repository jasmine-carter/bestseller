class BestSeller::CLI

  def call
    hello
    menu
    goodbye
  end

  def menu
    while input != "exit"
    list_categories
    state = category_view
    #while in category view - prompt user to select category or exit
    #while in books by category view - prompt user to select a book, exit, or go back to category view
    #while in book view - prompt user to exit, go back to books by that category, or categories views
    puts "If you'd like to see books within a category, enter the category number:"
    input = ""
      #case when input is an integer list_books_by_categories(input)
      #case when input is a string get_book_information
      input = gets.chomp
      list_books_by_categories(input) #turn into find or create list by category
        back = input #allows user to call list of categories from book view
        state = books_by_category_view
       puts "If you'd like to see more info on any of these books, enter book number. If you'd like to go back to categories, type categories, or type exit."
          input = gets.chomp
          if input.to_i != 0
            state = book_view
          elsif input == "categories"
            state = category_view
          elsif input == "exit"
            goodbye
          elsif input == "back"
            list_books_by_categories(back)
            state = books_by_category_view
          end
       #revised case statement for input handling
       #input = gets.chomp
       #case input
       #when "exit"
        # goodbye
       #when input.downcase.include?("category")
         #list_books_by_categories(input[-1].to_i)
       #when input.downcase.include?("book")
         #example input "book 2"
         #takes the input, strips to number of the book
         #need to get from string input of book 2, to be a book title for show_selected_book_info method
         #self.show_selected_book_info(input)
       #when input == "categories"
         #list_categories
       #else
        #puts "Command not recognized. Type \"categories\" to view a list of categories.\n Type exit to end."

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
        Books.find_or_create_from_category(category) #used to be create_from_category
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

  def hello
    puts "Welcome to the New York Times Best Seller CLI!"
  end

end
