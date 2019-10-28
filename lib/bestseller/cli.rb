class BestSeller::CLI

  def call
    puts "Welcome to the New York Times Best Seller CLI!"
    puts "Here are the current best seller categories."
   
    puts "1. Combined Print & E-Book Fiction"
    puts "2. Combined Print & E-Book Nonfiction"
    puts "3. Hardcover Fiction"
    puts "4. Hardcover Nonfiction"
    puts "5. Paperback Trade Fiction"
    puts "6. Paperback Nonfiction"
    puts "7. Advice, How-To & Miscellaneous"
    puts "8. Children’s Middle Grade Hardcover"
    
    puts "If you'd like to see books within a category, enter the category number:"
    
    user_input = ""
    user_input = gets.chomp
  end  
  
end 