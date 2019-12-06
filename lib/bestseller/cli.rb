class BestSeller::CLI

  def call
    hello
    menu
  end

  def menu
      input = ""
      state = "category_view"
    while input.downcase != "exit"
    	case state
      when "category_view"
        puts "\n"
        list_categories
      	puts "If you'd like to see books within a category, enter the category number. To exit, type \"exit\"."
      	input = gets.chomp
          if input.downcase == "exit"
            goodbye
          elsif input.to_i != 0 && input.to_i >= 1 && input.to_i <= Categories.all.length && (1..Categories.all.length).include?(input.to_i)
            list_books_by_categories(input)
            back = input
            state = "books_by_category_view"
            category = Categories.all[input.to_i-1]
          else puts "That doesn't look like a valid category number. Please enter a category number, or type \"exit\"."
            state = "category_view"
          end
      when "books_by_category_view"
        puts "If you'd like to see more info on any of these books, enter a book number. If you'd like to go back to categories, type \"categories\", or type \"exit\"."
        input = gets.chomp
        if input.downcase == "exit"
          goodbye
        elsif input.to_i != 0
          state = "book_view"
        if input.to_i >=1 && input.to_i <= category.books.count && (1..category.books.count).include?(input.to_i)
          book = category.books[input.to_i-1]
          show_selected_book_info(book)
        else
          puts "That doesn't look like a valid book number."
          state = "books_by_category_view"
          end
        elsif input == "categories"
          state = "category_view"
        elsif input == "back"
          list_books_by_categories(back)
          state = "books_by_category_view"
        else
          puts "\n"
          puts "That doesn't appear to be a valid command."
          state = "books_by_category_view"
        end
      when "book_view"
          puts "If you'd like to go back to the list of books by category, type \"back\". \nTo view the category list, type \"categories\".\nOr type \"exit\"."
          input = gets.chomp
          if input.downcase == "categories"
        	   state = "category_view"
           elsif input.downcase == "back"
             state = "books_by_category_view"
             list_books_by_categories(back)
           elsif input.downcase == "exit"
             goodbye
           else
          	 puts "That doesn't look like a valid book number. Please enter a valid book number."
           end
         end
      end
  end

  def list_categories
    #it will put all categories scraped from NYTimes best seller list
    Categories.return_or_create
    Categories.all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end


  def list_books_by_categories(input)
    input = input.to_i
    if input >= 1 && input <= Categories.all.length && (1..Categories.all.length).include?(input) #possibly get rid of, is handled in line 21
        category = Categories.all[input-1]
        puts "\n"
        puts "You've selected," + "\s#{Categories.all[input-1].name}.".bold
        puts "Here are the books currently in that category."
        Books.find_or_create_from_category(category)
        puts "\n"
        Categories.display_books_by_category(category)
    end
  end

  def show_selected_book_info(book)#method takes the string selection input of a user and finds the matching book object
    puts "\n"
    puts "You've selected" + "\s#{book.title}".bold + ".\sHere's more information about it!"
    puts "\n"
    puts "Time on the Best Seller List:".underline +  "\s#{book.time_on_list}"
    puts "Title:".underline + "\s#{book.title}"
    puts "Author:".underline + "\s#{book.author}"
    puts "Publisher:".underline + "\s#{book.publisher}"
    puts "Brief Description:".underline + "\s#{book.description}"
    puts "\n\n"
  end

  #build out methods for each menu state

  #def category_menu
  #end


  def goodbye
    puts "Happy Reading!"
  end

  def hello
    puts "Welcome to the New York Times Best Seller CLI!"
  end

end
