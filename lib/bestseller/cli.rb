class BestSeller::CLI

  def call
    puts "Welcome to the New York Times Best Seller CLI!"
    list_categories
    menu
    goodbye
  end  
  
  def menu
    puts "If you'd like to see books within a category, enter the category number:"
    
    puts input
    input = ""
    while input != "exit"
       input = gets.chomp
       case input
       when "1"
         puts "list of books under category 1"
       when "2" 
         puts "list of books under category 2"
       end
    end 
  end  
  
  def list_categories
    #it will put all categories scraped from NYTimes best seller list
    puts "Here are the current best seller categories."
    puts "1. Combined Print & E-Book Fiction"
    puts "2. Combined Print & E-Book Nonfiction"
    puts "3. Hardcover Fiction"
    puts "4. Hardcover Nonfiction"
    puts "5. Paperback Trade Fiction"
    puts "6. Paperback Nonfiction"
    puts "7. Advice, How-To & Miscellaneous"
    puts "8. Children’s Middle Grade Hardcover"
  end  
  
  def list_books_by_categories
    #it puts "#{time_on_list}: , #{book_title} by #{book_author} - Published by #{book_publisher} \n #{book_description}."
    puts "New this week: The Guardians by John Grisham - Published by Doubleday \n Cullen Post, a lawyer and Episcopal minister, antagonizes some ruthless killers when he takes on a wrongful conviction case."
  end  
  
  def goodbye
    puts "Happy Reading!"
  end
end 