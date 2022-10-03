require './app'

def main
  app = App.new
  exit = 0
  puts 'Welcome to School Library App!'

  while exit.zero?
    print "\n
    Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit
    \n"
    option = gets.chomp.to_i
    option == 7 ? exit = 1 : app.select_option(option)
  end
  puts 'Thanks for using the app!'
end

main
