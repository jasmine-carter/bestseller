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
  
  def list_books_by_categories(category)
    #it puts "#{time_on_list}: , #{book_title} by #{book_author} - Published by #{book_publisher} \n #{book_description}."
    if category == "1"
      puts "1. New this week: The Guardians by John Grisham - Published by Doubleday \n Cullen Post, a lawyer and Episcopal minister, antagonizes some ruthless killers when he takes on a wrongful conviction case."
      puts "2. 58 weeks on the list: Where the Crawdads Sing by Delia Owens - Published by Putnam \n In a quiet town on the North Carolina coast in 1969, a young woman who survived alone in the marsh becomes a murder suspect."
      puts "3. 2 weeks on the list: The 19th Christmas by James Patterson and Maxine Paetro - Published by Little,Brown \n In the 19th installment of the Women's Murder Club series, detective Lindsay Boxer and company take on a fearsome criminal known only as \"Loman.\""
      elsif category == "2"
        puts "1. New this week: ME by Elton John - Published by Holt \n The multi-award-winning solo artist's first autobiography chronicles his career, relationships and private struggles."
        puts "2. New this week: Catch and Kill by Ronan Farrow - Published by Little, Brown \n The Pulitzer Prize-winning reporter details some surveillance and intimidation tactics used to pressure journalists and elude consequences by certain wealthy and connected men."
        puts "3. 3 weeks on the list: Blowout by Rachel Maddow - Published by Crown \n The MSNBC host argues that the global oil and gas industry has weakened democracies and bolstered authoritarians."
      else
        puts "Sorry, I don't recognize that category number."
    end
  end  
  
  def goodbye
    puts "Happy Reading!"
  end
end 