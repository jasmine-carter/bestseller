class BestSeller::CLI

  def call
    hello
    menu
    goodbye
  end

  def menu
      input = ""
      state = "category_view"
      #list_categories
      #input = gets.chomp
    while input.downcase != "exit"
    	case state
      when "category_view"
      		list_categories
      		puts "If you'd like to see books within a category, enter the category number:"
      		input = gets.chomp
            	list_books_by_categories(input)
            	back = input
            	state = "books_by_category_view"
              category = Categories.all[input.to_i-1]
          when "books_by_category_view"
          	puts "If you'd like to see more info on any of these books, enter book number. If you'd like to go back to categories, type \"categories\", or type \"exit\"."
                input = gets.chomp
                if input.to_i != 0
                 state = "book_view"
                 puts "you're in the book view"
                 #write code to select book
                  if input.to_i >=1 && input.to_i <= category.books.count && (1..category.books.count).include?(input.to_i)
                    book = category.books[input.to_i-1]
                    show_selected_book_info(book)
                  else
                    puts "That doesn't look like a valid book number. Please enter a valid book number."
                  end

               elsif input == "categories"
                 state = "category_view"
               elsif input == "back"
                 list_books_by_categories(back)
                 state = "books_by_category_view"
               #elsif input == "exit" build in function to exit in this state
               else
                  puts "Command not recognized. \n If you'd like to see more info on any of these books, enter book number. If you'd like to go back to categories, type \"categories\", or type \"exit\"."
                 input = gets.chomp
               end
          when "book_view"
            puts "If you'd like to go back to the list of books by category, type \"back\". \n To view the category list, type \"categories\".\n Or type \"exit\"."
            input = gets.chomp
            if input.downcase == "categories"
          		state = "category_view"
          	elsif input.downcase == "back"
          		state = "books_by_category_view"
          	else
          	 puts "Command not recognized. To view the category list, type \"categories\".\n Or type \"exit\"."
           end
        end
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
        Categories.display_books_by_category(category)
      else
        puts "Sorry, I don't recognize that category number."
    end
  end

  def show_selected_book_info(book)#method takes the string selection input of a user and finds the matching book object
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
